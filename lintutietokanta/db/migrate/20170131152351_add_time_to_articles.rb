class AddTimeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :time, :string
  end
end
