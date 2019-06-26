class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.string :battletag
      t.string :role
      t.integer :sr
      t.string :email

      t.timestamps
    end
  end
end
