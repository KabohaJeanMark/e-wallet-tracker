class AddGroupidToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :group_id, :integer
  end
end
