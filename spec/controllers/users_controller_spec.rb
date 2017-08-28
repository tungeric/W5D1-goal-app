require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) do
    User.create(username: "bob", password: "bobsburgers")
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, params: {id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates presence of username and password" do
        post :create, params: { user: { password: "no_username" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it "validates password length > 6" do
        post :create, params: { user: { username: "shorty", password: "not6" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
    context "with valid params" do
      it "redirects to user show page" do
        post :create, params: { user: { username: "exists", password: "a_username" } }
        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end
end
