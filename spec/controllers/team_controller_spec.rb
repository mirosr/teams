RSpec.describe TeamController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'initializes @teams' do
      allow(Team).to receive(:all) { [:teams] }

      get :index

      expect(assigns(:teams)).to eq([:teams])
    end
  end

  describe 'POST #fetch' do
    it 'returns http success' do
      post :fetch, format: :js

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:fetch, format: :js)
    end

    it 'initializes @team' do
      allow(Team).to receive(:find).with('123') { :team }

      post :fetch, format: :js, team: '123'

      expect(assigns(:team)).to eq(:team)
    end
  end
end
