class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(contents)
    contents.each do |n|
      if n != ""
        new_n = Note.create(content: n)
        self.notes << new_n
        self.save
      end
    end
  end
end
