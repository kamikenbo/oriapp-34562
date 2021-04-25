class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_one_attached :image

  validates :text, presence: true
end
