FactoryBot.define do
  factory :recipe do
    name              { 'test-title' }
    material          { 'test-material' }
    alcohol_id        { 2 }
    category_id       { 2 }
    genre_id          { 2 }
    explanation       { 'test-explanation' }
    point             { 'test-point' }
    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
