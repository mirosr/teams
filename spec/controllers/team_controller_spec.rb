RSpec.describe TeamController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'initializes @teams' do
      get :index

      expect(assigns(:teams)).to respond_to(:map)
    end
  end

  describe 'POST #fetch' do
    it 'returns http success' do
      post :fetch, format: :js

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:fetch, format: :js)
    end

    it 'initializes @team' do
      team = double(:team)
      allow(Team).to receive(:find).with('football.dat','123') { team }

      post :fetch, format: :js, team: '123'

      expect(assigns(:team)).to eq(team)
    end
  end
end
