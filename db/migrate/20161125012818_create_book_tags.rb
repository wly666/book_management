class CreateBookTags < ActiveRecord::Migration
  def change
    create_table :book_tags do |t|
      t.belongs_to :book, :comment=>"图书id"
      t.belongs_to :tag, :comment=>"标签id"
      t.string :weight, :comment=>"标签权重"
    end
  end
end
