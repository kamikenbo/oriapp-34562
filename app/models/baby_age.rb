class BabyAge < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '0歳0ヶ月~0歳4ヶ月' },
    { id: 3, name: '0歳5ヶ月~0歳8ヶ月' },
    { id: 4, name: '0歳9ヶ月~0歳12ヶ月' },
    { id: 5, name: '1歳0ヶ月~1歳4ヶ月' },
    { id: 6, name: '1歳5ヶ月~1歳8ヶ月' },
    { id: 7, name: '1歳9ヶ月~1歳12ヶ月' },
    { id: 8, name: '2歳0ヶ月~2歳4ヶ月' },
    { id: 9, name: '2歳5ヶ月~2歳8ヶ月' },
    { id: 10, name: '2歳9ヶ月~2歳12ヶ月' },
    { id: 11, name: '3歳0ヶ月~3歳4ヶ月' },
    { id: 12, name: '3歳5ヶ月~3歳8ヶ月' },
    { id: 13, name: '3歳9ヶ月~3歳12ヶ月' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
