FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    password { 'aaa111' }
    password_confirmation {password}
  end
end