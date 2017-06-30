require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil, artist = nil)
    @name = name
    @artist_name = artist
  end

  def save
    self.class.all << self
    self.class.all.last
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name).save
  end

  def self.find_by_name(name)
    self.all.select {|song| song.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    self.all.include?(name)? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song_and_artist = file.split(" - ")
    self.new(song_and_artist[1].split(".")[0], song_and_artist[0])
  end

  def self.create_from_filename(file)
    song_and_artist = file.split(" - ")
    self.new(song_and_artist[1].split(".")[0], song_and_artist[0]).save

  end

  def self.destroy_all
      self.all.clear
  end

end
