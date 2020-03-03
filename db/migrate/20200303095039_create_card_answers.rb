class CreateCardAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :card_answers do |t|
      t.string :answer
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
