#This is a bot that fills todo model variables title and created_by with dummy data
FactoryBot.define do
    factory :todo do
        title {Faker::Lorem.word}
        created_by {Faker::Number.number(digits:10)}
    end
end