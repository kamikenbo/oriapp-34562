class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_one_attached :video

  scope :search, -> (search_params) do
    return if search_params.blank?
    
      content_like(search_params[:content])
      .category_id_is(search_params[:category_id])
      .condition_id_is(search_params[:condition_id])
      .baby_age_id_is(search_params[:baby_age_id])
      .baby_gender_id_is(search_params[:baby_gender_id])
  end

  scope :content_like, -> (content) { where('content LIKE ?', "%#{content}%") if content.present? }
  scope :category_id_is, -> (category_id) { where(category_id: category_id)  if category_id.present? }
  scope :condition_id_is, -> (condition_id) { where(condition_id: condition_id) if condition_id.present? }
  scope :baby_age_id_is, -> (baby_age_id) { where(baby_age_id: baby_age_id) if baby_age_id.present? }
  scope :baby_gender_id_is, -> (baby_gender_id) { where(baby_gender_id: baby_gender_id) if baby_gender_id.present? }
  
  with_options presence: true do
    validates :content
    validates :image,unless: :has_attached?
    validates :video, unless: :was_attached?
  end

  with_options presence: true, numericality: { other_than: 1 } do
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

  def was_attached?
    self.image.attached?
  end
  def has_attached?
    self.video.attached?
  end
end
