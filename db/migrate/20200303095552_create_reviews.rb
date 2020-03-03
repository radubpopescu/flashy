class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review_value
      t.text :content
      t.references :user, foreign_key: true
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
