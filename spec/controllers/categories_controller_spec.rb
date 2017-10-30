require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'redirects to sign in page' do
      get :index
      expect(response).to redirect_to new_user_session_url
    end
  end
end
