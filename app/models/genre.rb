class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'スピード' },
    { id: 3, name: 'あっさり' },
    { id: 4, name: 'ガッツリ' },
    { id: 5, name: '胃もたれ' },
    { id: 6, name: '煮込み' },
    { id: 7, name: '至高' },
    { id: 8, name: '悪魔' },
    { id: 9, name: 'トリッキー' },
    { id: 10, name: '節約' }
  ]
  include ActiveHash::Associations
  has_many :recipes
end