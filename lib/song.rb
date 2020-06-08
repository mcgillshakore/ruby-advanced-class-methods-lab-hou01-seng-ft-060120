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
   song = self.new
   @@all << song
   song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song
    song
  end

  def self.find_by_name(name)
    song = self.new
    @@all.find do |song|
      song.name == name 
    end
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    if filename.include?(".mp3")
      from_filename = filename.chomp(".mp3").split(" - ")
      song = from_filename[1]
      artist = from_filename[0]
      @song = self.new
      @song.save
      @song.name = song
      @song.artist_name = artist
    end
    @song
  end
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
