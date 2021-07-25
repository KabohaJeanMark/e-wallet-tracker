class AddAuthorIdToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :author_id, :integer
  end
end
