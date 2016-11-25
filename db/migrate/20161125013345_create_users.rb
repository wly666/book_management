class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :comment=>"用户姓名"
      t.integer :phone_number, :comment=>"电话号码(8888888)"
      t.string :email, :comment=>"用户邮箱(例如123456@qq.com)"
      t.string :borrow_card, :comment=>"借书证"
      t.datetime :current_sign_in_at, :comment=>"当前登陆时间（例如：2016-11-21 00:00:00）"
      t.datetime :last_sign_in_at, :comment=>"上一次登陆时间（例如：2016-11-19 00:00:00）"
      t.integer :sign_in_count, :comment=>"登陆总次数(例如：5次)"
    end
  end
end
