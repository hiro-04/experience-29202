FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    first_name              {"阿部"}
    family_name             {"晋三"}
    first_name_kana         {"アベ"}
    family_name_kana        {"シンゾウ"}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    birthday                {"1990-12-01"}
  end
end