class User < ApplicationRecord
  # validates :name, presence: true
  # validates :email, presence: true 
  validates :username, presence: true, uniqueness: true

  has_many :artwork_shares,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare

  has_many :artworks,
  foreign_key: :artist_id,
  class_name: :Artwork

  has_many :shared_artworks,
  through: :artwork_shares,
  source: :artwork

  has_many :comments,
  foreign_key: :commenter_id,
  class_name: :Comment,
  dependent: :destroy

end