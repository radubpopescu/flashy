class CreateFavoriteDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_decks do |t|
      t.references :user, foreign_key: true
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
