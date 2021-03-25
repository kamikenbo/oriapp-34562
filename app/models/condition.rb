class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '便利' },
    { id: 3, name: '危険' },
    { id: 4, name: '悩み' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
