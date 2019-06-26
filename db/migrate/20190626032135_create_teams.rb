class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :sr
      t.string :gm
      t.string :captain
      t.string :coach
      t.string :discordname
      t.string :discordlink
      t.string :twittername
      t.string :twitterlink
      t.string :affiliate

      t.timestamps
    end
  end
end
