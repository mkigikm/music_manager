class Album < ActiveRecord::Base
  validates :title, :band_id, :studio, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy

  def studio?
    studio
  end

  def live?
    !studio
  end

  def extended_title
    "#{band.name} - #{title}"
  end
end
