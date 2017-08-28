require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create({ username: 'exists', password: 'a_username' }) }

  describe 'GET #new' do
    it "renders the new session template" do
      get :new
      expect(response).to render_template(:new)
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
        expect(response).to redirect_to(user_url(user))
      end
    end
  end

end
