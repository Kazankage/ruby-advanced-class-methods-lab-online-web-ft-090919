class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect {|s| s == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    song_name = parts[1].gsub(".mp3","")
    artist_name = parts[0]
      
      song = self.new
      song.name = song_name 
      song.artist_name = artist_name
      song
  end
  
  def self.create_by_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    
      song = self.create 
      song.name = song_name
      song.artist_name = artist_name
      song
  end
  
  def self.destroy_all
    @@all.clear
  end
    
end




song = Song.create_by_filename("Taylor Swift - Blank Space.mp3")
print song.name #=> "Blank Space"
puts
print song.artist_name #=> "Taylor Swift"