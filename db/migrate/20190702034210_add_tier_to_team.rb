class AddTierToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :tier, :string
  end
end
