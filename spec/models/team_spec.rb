RSpec.describe Team do
  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:name) }

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

  private

  def fixture_root_path
    Rails.root.join('spec', 'fixtures')
  end

  def fixture_array
    [
      Team.new('1', 'Arsenal'),
      Team.new('2', 'Liverpool'),
      Team.new('3', 'Manchester_U')
    ]
  end

  def liverpool
    Team.new('2', 'Liverpool')
  end
end
