require 'faker'

FactoryGirl.define do
  factory :poi do
    nome { Faker::Lorem.words.join ' ' }
    x 10
    y 10

    factory :invalid_poi do
      nome nil
      x -1
      y -1
    end
  end
end