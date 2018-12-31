task :parse => [:environment] do
  Song.connection

  19.times do |x|
    file = File.read(File.join(File.dirname(__FILE__), "final/#{x + 1}.json"))
    data_hash = JSON.parse(file)
    data_hash.each do |data|
      song = Song.new(title: data["title"], artist: data["artist"], number: data["number"], favorite: false)
      song.save!
    end
  end
end