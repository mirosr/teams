RSpec.describe TeamController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'initializes @teams' do
      get :index

      expect(assigns(:teams)).to respond_to(:map)
    end
  end
end
