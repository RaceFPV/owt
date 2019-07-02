class AddTierToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :tier, :string
  end
end
