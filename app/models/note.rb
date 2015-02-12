class Note < ActiveRecord::Base
  validates :author_id, :track_id, :body, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :track
end
