require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { User.create!(username: 'dog', password: 'dogdog') }

  describe 'GET #new' do
      context 'when logged in' do
        before do
          allow(controller).to receive(:current_user) { user }
        end

        it 'renders the new goal page' do
          get :new
          expect(response).to render_template('new')
        end
      end

      context 'when logged out' do
        before do
          allow(controller).to receive(:current_user) { nil }
        end

        it 'redirects to the login page' do
          get :new
          expect(response).to redirect_to(new_session_url)
        end
      end
    end

  describe 'POST #create' do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { user }
      end
      it 'checks for presence of user id and title' do
        post :create, params: { goal: { user_id: user.id } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
      it 'renders the goal page' do
        post :create, params: { goal: { title: 'there is a user_id', user_id: user.id } }
        expect(response).to redirect_to(goal_url(Goal.last))
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end
    end
  end

  describe 'GET #index' do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { user }
      end

      it 'renders the goal index page' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe 'GET #edit'
    before do
      allow(controller).to receive(:current_user) { user }
      @goal = Goal.create(title: 'brush teeth', author: user)
    end

    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { user }
      end

      it 'renders the edit goal page' do
        get :new
        expect(response).to render_template('edit')
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end


    describe 'PATCH #update' do
      context 'when logged in' do
        before do
          allow(controller).to receive(:current_user) { user }
        end
        it 'checks for presence of user id and title' do
          patch :update, params: { goal: { user_id: user.id } }
          expect(response).to render_template(:edit)
          expect(flash[:errors]).to be_present
        end
        it 'renders the goal page' do
          post :create, params: { goal: { title: 'there is a user_id', user_id: user.id } }
          expect(response).to redirect_to(goal_url(Goal.last))
        end
      end

      context 'when logged out' do
        before do
          allow(controller).to receive(:current_user) { nil }
        end
        it 'redirects to the login page' do
          get :new
          expect(response).to redirect_to(new_session_url)
        end
      end
    end

    describe 'GET #show' do
        context 'when logged in' do
          before do
            allow(controller).to receive(:current_user) { user }
          end

          it 'renders the show goal page' do
            get :new
            expect(response).to render_template('show')
          end
        end

        context 'when logged out' do
          before do
            allow(controller).to receive(:current_user) { nil }
          end

          it 'redirects to the login page' do
            get :new
            expect(response).to redirect_to(new_session_url)
          end
        end
      end
    end
