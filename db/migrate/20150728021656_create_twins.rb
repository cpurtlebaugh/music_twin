class CreateTwins < ActiveRecord::Migration
  def change
    create_table :twins do |t|
      t.string :name
      t.string :mbid
      t.string :image_uri
      t.text :rankings

      t.timestamps null: false
    end
  end
end
