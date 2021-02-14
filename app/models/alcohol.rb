class Alcohol < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ビール・ホッピー' },
    { id: 3, name: 'ハイボール・ウイスキー' },
    { id: 4, name: '洋酒サワー' },
    { id: 5, name: 'サワー' },
    { id: 6, name: '日本酒' },
    { id: 7, name: '焼酎' },
    { id: 8, name: 'ワイン' },
    { id: 9, name: '果実酒' },
    { id: 10, name: 'カクテル' }
    { id: 11, name: 'お茶割り' }
  ]
  include ActiveHash::Associations
  has_many :recipes
end