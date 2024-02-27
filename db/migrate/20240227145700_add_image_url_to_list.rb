class AddImageUrlToList < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :image_url, :string, null: false
  end
end
