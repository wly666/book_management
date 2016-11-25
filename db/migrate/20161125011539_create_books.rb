class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, :comment=>"图书名称(例如：ruby详解)"
      t.string :author, :comment=>"图书作者(例如：小李)"
      t.text :summary, :comment=>"图书简介(例如：这本书是描述关于ruby的，是ruby详解)"
      t.integer :status_id, :comment=>"图书是否可借阅状态id(0表示不可借阅，1表示可借阅)"
      t.string :book_position, :comment=>"图书位置信息(例如：第一行第5本)"
      t.integer :amount, :comment=>"图书馆总共存书量(例如：6本)"
      t.belongs_to :category, :comment=>"图书分类id，关联图书分类表"
    end
  end
end
