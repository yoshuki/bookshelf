require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to redirect_to new_user_session_url
    end
  end
end
