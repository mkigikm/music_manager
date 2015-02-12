class Track < ActiveRecord::Base
  validates :title,  presence: true
  validates :bonus, inclusion: { in: [true, false] }

  belongs_to :album
  has_one :band, through: :album
  has_many :notes

  def bonus?
    bonus
  end

  def regular?
    !bonus.nil? && !bonus
  end

  def extended_title
    "#{band.name} - #{album.title} - #{title}"
  end
end
