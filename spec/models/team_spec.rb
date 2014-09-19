RSpec.describe Team do
  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:name) }

  describe '.all' do
    it 'returns an array with team info from a file' do
      expect(Team.all('football.dat')).to eq(fixture_array)
    end
  end

  private

  def fixture_array
    [
      Team.new('1', 'Arsenal'),
      Team.new('2', 'Liverpool'),
      Team.new('3', 'Manchester_U')
    ]
  end
end
