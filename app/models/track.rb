class Track < ActiveRecord::Base
  validates :title, :bonus, presence: true

  belongs_to :album

  def bonus?
    bonus
  end
end
