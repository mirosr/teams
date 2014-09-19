Team = Struct.new(:id, :name) do
  def self.all(filename)
    filename = Rails.root.join('spec', 'fixtures', filename)

    File.open(filename).each_line.select {|item| item =~ /^\s+\d/}.map do |line|
      cols = line.chomp.split(/\s{2,}/)

      id, name = cols[1].split('. ')

      new(id, name)
    end
  end
end
