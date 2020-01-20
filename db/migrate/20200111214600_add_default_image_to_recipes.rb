class AddDefaultImageToRecipes < ActiveRecord::Migration
  def change
       change_column_default :clients, :image, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8SyFsniTLCC5pw6Y_GFgRuLR6-b4fKGmmGhGgj4Jd0tTuosAI&s"
  end
end
