class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '食事' },
    { id: 3, name: '遊び' },
    { id: 4, name: 'イヤイヤ期' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
