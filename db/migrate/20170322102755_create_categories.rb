class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|

      t.timestamps
    end
  end
  
  def change
    add_column :categories, :name, :string
  end
  
end
