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

puts 'creating all seeds'
deck = Deck.create!(name: 'Learn HTML, CSS & JS', user: user, category: tech)
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

puts 'done'
