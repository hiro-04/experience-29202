FactoryBot.define do
  factory :article do
    title                         {Faker::Lorem.sentence}
    content                       {Faker::Lorem.sentence}
    category_id                   {2}
    association :user
    
    after(:build) do |article|
      article.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
