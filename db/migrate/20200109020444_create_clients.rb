class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.text :bio
      t.string :image
      t.integer :user_id
    end
  end
end
