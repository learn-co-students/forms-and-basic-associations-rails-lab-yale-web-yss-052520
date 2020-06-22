class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.save
  end

  def note_contents=(notes)
    # byebug
    notes.each do |note|
      unless note==""
        Note.create(content: note)
        self.notes << Note.last
        self.save
      end
    end
  end

end
