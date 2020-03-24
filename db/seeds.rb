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
tech = Category.create!(name: 'Technology')
bio = Category.create!(name: 'Biology')
physics = Category.create!(name: 'Physics')
languages = Category.create!(name: 'Languages')
chemistry = Category.create!(name: 'Chemistry')
history = Category.create!(name: 'History')
others = Category.create!(name: 'Others')

puts 'creating all decks'
decks = []
decks << deck_1 = Deck.create!(name: 'Learn HTML, CSS & JS', user: user, category: tech, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus mi sed ex ornare vestibulum quis facilisis tortor. Nulla sapien sem, feugiat ac suscipit ac, placerat nec ex. Integer elit risus, semper non eros non, feugiat imperdiet orci. Duis hendrerit tempor risus in ornare. Nam ipsum tortor, tincidunt eget felis et, varius fermentum felis.")
decks << deck_2 = Deck.create!(name: 'How DNA Works', user: user, category: bio)
decks << deck_3 = Deck.create!(name: 'Physics for dummies', user: user, category: physics,description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus mi sed ex ornare vestibulum quis facilisis tortor. Nulla sapien sem, feugiat ac suscipit ac, placerat nec ex. Integer elit risus, semper non eros non, feugiat imperdiet orci. Duis hendrerit tempor risus in ornare. Nam ipsum tortor, tincidunt eget felis et, varius fermentum felis.")
decks << deck_3 = Deck.create!(name: 'Introduction to Ruby', user: user, category: tech)
decks << deck_4 = Deck.create!(name: 'Basics of Python', user: user, category: tech)
decks << deck_5 = Deck.create!(name: 'Genetics and Heredity', user: user, category: bio)
decks << deck_6 = Deck.create!(name: 'Months in German', user: user, category: languages)
decks << deck_7 = Deck.create!(name: 'Japanese verbs 1', user: user, category: languages)
decks << deck_8 = Deck.create!(name: 'Japanese verbs 2', user: user, category: languages)
decks << deck_9 = Deck.create!(name: 'Colours in French', user: user, category: languages)
decks << deck_10 = Deck.create!(name: 'Spanish pronouns', user: user, category: languages)
decks << deck_11 = Deck.create!(name: 'Countries in Italian', user: user, category: languages)
decks << deck_12 = Deck.create!(name: 'Animals in Portuguese', user: user, category: languages)
decks << deck_13 = Deck.create!(name: 'Vue JS for beginners', user: user, category: tech)
decks << deck_14 = Deck.create!(name: 'React JS for beginners', user: user, category: tech)
decks << deck_15 = Deck.create!(name: 'Newton\'s Laws', user: user, category: physics)
decks << deck_16 = Deck.create!(name: 'Pascal\'s Law', user: user, category: physics)
decks << deck_17 = Deck.create!(name: 'Ohm\'s Law and Electromagnetism', user: user, category: physics)
decks << deck_18 = Deck.create!(name: 'Periodic Table', user: user, category: chemistry)
decks << deck_19 = Deck.create!(name: 'React Native advanced', user: user, category: tech)
decks << deck_20 = Deck.create!(name: 'Flutter Basics', user: user, category: tech)
decks << deck_21 = Deck.create!(name: 'Dart for Total Beginners', user: user, category: tech)
decks << deck_22 = Deck.create!(name: 'Introduction to PHP', user: user, category: tech)
decks << deck_23 = Deck.create!(name: 'Work-Energy Theorem', user: user, category: physics)
decks << deck_24 = Deck.create!(name: 'Organic Chemistry', user: user, category: chemistry)
decks << deck_25 = Deck.create!(name: 'Atomic Physics', user: user, category: physics)
decks << deck_26 = Deck.create!(name: 'Cell Structure', user: user, category: bio)

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
    Review.create(review_value: random, deck_id: deck.id, user_id: user.id, content: Faker::TvShows::MichaelScott.quote)
  end
end

puts "creating user Bernardo Goes"
user_01 = User.create!(email: "bernardo@gmail.com", password: "123456")
FavoriteCategory.create!(user: user_01, category: bio)
puts "created Bernardo Goes"

puts 'done'
