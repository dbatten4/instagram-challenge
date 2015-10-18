class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.belongs_to :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
