class AddPlaceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :place, :string
  end
end
