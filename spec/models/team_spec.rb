RSpec.describe Team do
  describe '.all' do
    it 'acts as an array' do
      expect(Team.all).to respond_to(:map)
    end
  end
end
