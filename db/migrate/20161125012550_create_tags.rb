class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, :comment=>"图书标签名(例如：java，ruby)"
    end
  end
end
