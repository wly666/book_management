class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :comment=>"图书分类名称(例如：计算机)"
    end
  end
end
