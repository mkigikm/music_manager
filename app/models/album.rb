class Album < ActiveRecord::Base
  validates :title, :band_id, presence: true
  validates :studio, inclusion: { in: [true, false] }

  belongs_to :band
  has_many :tracks, dependent: :destroy

  def studio?
    studio
  end

  def live?
    !studio.nil? && !studio
  end

  def extended_title
    "#{band.name} - #{title}"
  end
end
