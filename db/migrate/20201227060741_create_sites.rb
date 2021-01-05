class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :site_name
      t.string :site_url
      t.text :discription

      t.timestamps
    end
  end
end
