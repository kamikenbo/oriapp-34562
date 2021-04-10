class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tweets, dependent: :destroy
         has_many :comments, dependent: :destroy

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
         with_options presence: true do
           validates :nickname, length: { maximum: 10 }
           validates :baby_name
           validates :birthday
         end
       

end
