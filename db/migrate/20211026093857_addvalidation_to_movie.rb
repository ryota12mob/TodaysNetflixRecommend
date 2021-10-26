class AddvalidationToMovie < ActiveRecord::Migration[6.0]
  def change
    change_column_null :movies,:title, false
    change_column_null :movies, :image, false
  end
end
