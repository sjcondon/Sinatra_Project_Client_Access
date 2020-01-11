class AddDefaultImageToRecipes < ActiveRecord::Migration
  def change
       change_column_default :clients, :image, "https://cdn2.vectorstock.com/i/1000x1000/67/11/user-sign-icon-person-symbol-with-shadow-human-vector-26066711.jpg"
  end
end
