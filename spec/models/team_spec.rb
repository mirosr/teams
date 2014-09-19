RSpec.describe Team do
  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:col_f) }
  it { is_expected.to respond_to(:col_a) }

  describe '.all' do
    it 'returns an array with team info from a file' do
      allow(Team).to receive(:root_path) { fixture_root_path }

      expect(Team.all('football.dat')).to eq(fixture_array)
    end
  end

  describe '.find' do
    it 'returns a team for the given id' do
      allow(Team).to receive(:root_path) { fixture_root_path }

      expect(Team.find('football.dat', 2)).to eq(liverpool)
    end

    context 'when the given id is not found' do
      it 'returns nil' do
        allow(Team).to receive(:root_path) { fixture_root_path }

        expect(Team.find('football.dat', 100)).to be_nil
      end
    end
  end

  describe '#to_s' do
    it 'returns a string representation in predefined format' do
      team = Team.new('100', 'Aaa', '10', '20')

      expect(team.to_s).to eq('100. Aaa 10-20')
    end
  end

  private

  def fixture_root_path
    Rails.root.join('spec', 'fixtures')
  end

  def fixture_array
    [
      Team.new('1', 'Arsenal', '79', '36'),
      Team.new('2', 'Liverpool', '67', '30'),
      Team.new('3', 'Manchester_U', '87', '45')
    ]
  end

  def liverpool
    Team.new('2', 'Liverpool', '67', '30')
  end
end
