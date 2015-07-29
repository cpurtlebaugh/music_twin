class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :twin_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
