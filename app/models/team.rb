Team = Struct.new(:id, :name) do
  def self.all(filename)
    File.open(root_path.join(filename)).each_line.select {|item| item =~ /^\s+\d/}.map do |line|
      cols = line.chomp.split(/\s{2,}/)

      id, name = cols[1].split('. ')

      new(id, name)
    end
  end

  private

  def self.root_path
    Rails.root.join('db')
  end
end
