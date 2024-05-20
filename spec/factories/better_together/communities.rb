# frozen_string_literal: true

FactoryBot.define do
  factory(
    :better_together_community,
    class: BetterTogether::Community,
    aliases: %i[community]
  ) do
    id { Faker::Internet.uuid }
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs(number: 3) }
    privacy { 'public' }
    creator
  end
end
