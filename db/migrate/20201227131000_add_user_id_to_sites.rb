class AddUserIdToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :user_id, :integer
  end
end
