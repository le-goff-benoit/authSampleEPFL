class Review < ApplicationRecord
  validates :title, :body, :image_url, presence: true

  belongs_to :user
end
