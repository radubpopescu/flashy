require 'csv'

puts 'destroying all seeds'
Deck.destroy_all
User.destroy_all

puts 'creating admin user'
user = User.create!(email: 'admin@flashy.com', password: '123456')

puts 'destroying categories'
Category.destroy_all
puts 'creating categories'
tech = Category.create!(name: 'technology')
bio = Category.create!(name: 'biology')
physics = Category.create!(name: 'physics')

puts 'creating all decks'
decks = []
decks << deck_1 = Deck.create!(name: 'Learn HTML, CSS & JS', user: user, category: tech)
decks << deck_2 = Deck.create!(name: 'How DNA Works', user: user, category: bio)
decks << deck_3 = Deck.create!(name: 'Physics for dummies', user: user, category: physics)

puts 'creating all cards'
decks.each do |deck|
  file = 'db/seeds.csv'
  csv_options = { col_sep: ',', headers: :first_row}
    CSV.foreach(file, csv_options) do |csv|
      print '.'
      card = Card.create!(
        front: csv["question"],
        back: csv["answer"],
        deck: deck
        )
    end
end
puts 'done'
