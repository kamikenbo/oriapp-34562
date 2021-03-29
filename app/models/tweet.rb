class Tweet < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one_attached :image
  # has_one_attached :video

  with_options presence: true do
    validates :content
    validates :image
  end

  with_options presence: true do
    validates :category_id
    validates :condition_id
    validates :baby_age_id
    validates :baby_gender_id

  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :baby_age
  belongs_to :baby_gender

end
