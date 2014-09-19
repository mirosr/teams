Team = Struct.new(:id, :name, :col_f, :col_a) do
  FILENAME = 'football.dat'

  def self.all
    load_data.map do |line|
      cols = line.chomp.split(/\s{2,}/)

      id, name = cols[1].split('. ')

      new(id, name, cols[6], cols[8])
    end
  end

  def self.find(team_id)
    all.detect { |team| team.id == team_id.to_s }
  end

  def to_s
    "#{id}. #{name} #{col_f}-#{col_a}"
  end

  private

  def self.load_data
    load_file.each_line.select { |line| line =~ /^\s+\d/ }
  end

  def self.load_file
    File.open(root_path.join(FILENAME))
  end

  def self.root_path
    Rails.root.join('db')
  end
end
