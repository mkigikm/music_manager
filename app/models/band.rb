class Band < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :destroy
  )
end
