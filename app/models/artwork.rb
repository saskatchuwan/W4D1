class Artwork < ApplicationRecord
  validates: :title, :image_url, :artist_id, presence: true
  # validates: how do we valdate an index for 2 columns
  validate_uniqueness_of :artist_id, scope: :title

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

end
