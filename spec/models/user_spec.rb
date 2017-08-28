require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.create!(
      username: "bob",
      password: "bobsburgers"
    )
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

  describe "password encryption" do
    it "should generate an encrypted password" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username:"dog",password:"123456")
    end

    it "should not save password to the database" do
      User.create!(username:"dog",password:"123456")
      user = User.find_by(username:"dog")
      expect(user.password).not_to be("123456")
    end
  end

end
