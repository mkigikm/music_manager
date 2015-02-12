class Track < ActiveRecord::Base
  validates :title, :bonus, presence: true

  belongs_to :album
  has_one :band, through: :album

  def bonus?
    bonus
  end

  def extended_title
    "#{band.name} - #{album.title} - #{title}"
  end
end
