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

  def note_contents=(notes)
    notes.each do |content|
      unless content.strip == ""
        new_note = Note.find_or_create_by(content: content)
      self.notes << new_note 
      end
    end
  end

  def note_contents
    self.notes.map{|note| note.content }
  end
end
