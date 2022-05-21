#This is a bot that fills item model varaible name with dummy data
FactoryBot.define do
    factory :item do
        name {Faker::StarWars.character}
        done {false}
        todo_id {nil}
    end
end