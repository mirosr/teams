RSpec.describe Team do
  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:name) }

  describe '.all' do
    it 'acts as an array' do
      expect(Team.all).to respond_to(:map)
    end
  end
end
