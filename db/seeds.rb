require 'csv'
require 'faker'

puts 'destroying all seeds'
FavoriteCategory.destroy_all
Deck.destroy_all
User.destroy_all

puts 'creating users'
user = User.create!(email: 'admin@flashy.com', password: '123456')
1000.times do
  User.create!(email: Faker::Internet.email, username: Faker::Name.first_name, password: "123456")
end

puts 'destroying categories'
Category.destroy_all
puts 'creating categories'
tech = Category.create!(name: 'technology')
bio = Category.create!(name: 'biology')
physics = Category.create!(name: 'physics')
coronavirus = Category.create!(name: 'coronavirus')
sex = Category.create!(name: 'sex')
beer = Category.create!(name: 'beer')
feijoada = Category.create!(name: 'feijoada')
random = Category.create!(name: 'random')
category = Category.create!(name: 'category')

puts 'creating all decks'
decks = []
decks << deck_1 = Deck.create!(name: 'Learn HTML, CSS & JS', user: user, category: tech)
decks << deck_2 = Deck.create!(name: 'How DNA Works', user: user, category: bio)
decks << deck_3 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_3 = Deck.create!(name: 'Ruby for dummies', user: user, category: tech)
decks << deck_4 = Deck.create!(name: 'Python for dummies', user: user, category: tech)
decks << deck_5 = Deck.create!(name: 'Coronvirus for dummies', user: user, category: bio)
decks << deck_6 = Deck.create!(name: 'How life works', user: user, category: random)
decks << deck_7 = Deck.create!(name: 'How cars work', user: user, category: random)
decks << deck_8 = Deck.create!(name: 'How I spent the end of my life', user: user, category: random)
decks << deck_9 = Deck.create!(name: 'Coffee and ciggarets', user: user, category: random)
decks << deck_10 = Deck.create!(name: 'Random 3', user: user, category: coronavirus)
decks << deck_11 = Deck.create!(name: 'Random 4', user: user, category: coronavirus)
decks << deck_12 = Deck.create!(name: 'How chairs are made', user: user, category: coronavirus)
decks << deck_13 = Deck.create!(name: 'Cotton candy', user: user, category: coronavirus)
decks << deck_14 = Deck.create!(name: 'Crew Hassan', user: user, category: coronavirus)
decks << deck_15 = Deck.create!(name: 'Learn to party', user: user, category: physics)
decks << deck_16 = Deck.create!(name: 'Headphones 101', user: user, category: physics)
decks << deck_17 = Deck.create!(name: 'Plastic Bottles', user: user, category: physics)
decks << deck_18 = Deck.create!(name: 'Keyboard for dummies', user: user, category: sex)
decks << deck_19 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_20 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_21 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_22 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_23 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_24 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_25 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)

puts 'creating all cards'
decks.each do |deck|
  file = 'db/seeds.csv'
  csv_options = { col_sep: ',', headers: :first_row}
    CSV.foreach(file, csv_options) do |csv|
      print '.'
      card = Card.create!(
        front: csv["Question"],
        back: csv["Answer"],
        deck: deck
        )
    end
end

puts 'destroying reviews'
Review.destroy_all

puts 'creating review values'
Deck.all.each do |deck|
  User.all.each do |user|
    random = rand(1..10) >= 3? 1 : -1
    Review.create(content: Faker::Hipster.sentence(word_count: rand(7..15)), review_value: random, deck_id: deck.id, user_id: user.id)
  end
end

puts 'done'
