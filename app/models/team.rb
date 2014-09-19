Team = Struct.new(:id, :name) do
  def self.all(filename)
    load_data(filename).map do |line|
      cols = line.chomp.split(/\s{2,}/)

      id, name = cols[1].split('. ')

      new(id, name)
    end
  end

  private

  def self.load_data(filename)
    load_file(filename).each_line.select { |line| line =~ /^\s+\d/ }
  end

  def self.load_file(filename)
    File.open(root_path.join(filename))
  end

  def self.root_path
    Rails.root.join('db')
  end
end
