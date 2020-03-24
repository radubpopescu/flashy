require 'csv'
require 'faker'

puts 'destroying all seeds'
FavoriteCategory.destroy_all
Deck.destroy_all
User.destroy_all

puts 'creating users'
user = User.create!(email: 'admin@flashy.com', password: '123456')
50.times do
  User.create!(email: Faker::Internet.email, username: Faker::Name.first_name, password: "123456")
end

puts 'destroying categories'
Category.destroy_all
puts 'creating categories'
tech = Category.create!(name: 'technology')
bio = Category.create!(name: 'biology')
physics = Category.create!(name: 'physics')
coronavirus = Category.create!(name: 'coronavirus')
geography = Category.create!(name: 'geography')
cooking = Category.create!(name: 'cooking')
music = Category.create!(name: 'music')
chinese = Category.create!(name: 'chinese')
anatomy = Category.create!(name: 'anatomy')

puts 'creating all decks'
decks = []
decks << deck_1 = Deck.create!(name: 'Learn HTML, CSS & JS', user: user, category: tech, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus mi sed ex ornare vestibulum quis facilisis tortor. Nulla sapien sem, feugiat ac suscipit ac, placerat nec ex. Integer elit risus, semper non eros non, feugiat imperdiet orci. Duis hendrerit tempor risus in ornare. Nam ipsum tortor, tincidunt eget felis et, varius fermentum felis.")
decks << deck_2 = Deck.create!(name: 'How DNA Works', user: user, category: bio)
decks << deck_3 = Deck.create!(name: 'Physics for dummies', user: user, category: physics,description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus mi sed ex ornare vestibulum quis facilisis tortor. Nulla sapien sem, feugiat ac suscipit ac, placerat nec ex. Integer elit risus, semper non eros non, feugiat imperdiet orci. Duis hendrerit tempor risus in ornare. Nam ipsum tortor, tincidunt eget felis et, varius fermentum felis.")
decks << deck_3 = Deck.create!(name: 'Ruby for dummies', user: user, category: tech)
decks << deck_4 = Deck.create!(name: 'Python for dummies', user: user, category: tech)
decks << deck_5 = Deck.create!(name: 'Coronvirus for dummies', user: user, category: bio)
decks << deck_6 = Deck.create!(name: 'How life works', user: user, category: anatomy)
decks << deck_7 = Deck.create!(name: 'How cars work', user: user, category: anatomy)
decks << deck_8 = Deck.create!(name: 'How I spent the end of my life', user: user, category: anatomy)
decks << deck_9 = Deck.create!(name: 'Coffee and ciggarets', user: user, category: anatomy)
decks << deck_10 = Deck.create!(name: 'Random 3', user: user, category: coronavirus)
decks << deck_11 = Deck.create!(name: 'Random 4', user: user, category: coronavirus)
decks << deck_12 = Deck.create!(name: 'How chairs are made', user: user, category: coronavirus)
decks << deck_13 = Deck.create!(name: 'Cotton candy', user: user, category: coronavirus)
decks << deck_14 = Deck.create!(name: 'Crew Hassan', user: user, category: coronavirus)
decks << deck_15 = Deck.create!(name: 'Learn to party', user: user, category: physics)
decks << deck_16 = Deck.create!(name: 'Headphones 101', user: user, category: physics)
decks << deck_17 = Deck.create!(name: 'Plastic Bottles', user: user, category: physics)
decks << deck_18 = Deck.create!(name: 'Keyboard for dummies', user: user, category: geography)
decks << deck_19 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_20 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_21 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_22 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_23 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_24 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_25 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)
decks << deck_26 = Deck.create!(name: 'Category test', user: user, category: chinese)

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
puts "/"
puts 'destroying reviews'
Review.destroy_all

puts 'creating review values'
Deck.all.each do |deck|
  User.all.each do |user|
    random = rand(1..10) >= 3? 1 : -1
    Review.create(review_value: random, deck_id: deck.id, user_id: user.id)
  end
end

puts "creating user Bernardo Goes"
user_01 = User.create!(email: "bernardo@gmail.com", password: "123456")
FavoriteCategory.create!(user: user_01, category: bio)
puts "created Bernardo Goes"

puts 'done'
