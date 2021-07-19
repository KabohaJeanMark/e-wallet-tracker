class AddAmountToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :amount, :integer
  end
end
