class CreateCirculates < ActiveRecord::Migration
  def change
    create_table :circulates do |t|
      t.belongs_to :book, :comment=>"所借书的id"
      t.belongs_to :user, :comment=>"借书人的id"
      t.datetime :borrow_date, :comment=>"借书时间"
      t.datetime :expect_back_date, :comment=>"预期还书时间"
      t.datetime :back_date, :comment=>"实际还书时间"
      t.integer :book_status_id, :comment=>"书是否损坏id（0表示损坏，1表示完好）"
      t.integer :status_id, :comment=>"图书是否已还（1表示在借中，0表示已还）"
    end
  end
end
