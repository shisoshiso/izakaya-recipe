class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'サラダ' },
    { id: 3, name: '魚' },
    { id: 4, name: 'つまみ' },
    { id: 5, name: '焼き鳥' },
    { id: 6, name: '揚物' },
    { id: 7, name: '逸品' },
    { id: 8, name: 'ご飯もの・麺類' },
    { id: 9, name: '甘味' },
  ]
  include ActiveHash::Associations
  has_many :recipes
end