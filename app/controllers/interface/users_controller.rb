class Interface::UsersController < ActionController::Base
  #def all
  #  message = User.all.map do |user|
  #    {
  #      :phone_number=>user.phone_number,
  #      :borrow_card=>user.borrow_card
  #    }
  #  end
  #  render :json=>{
  #    :success=>true,
  #    :result=>message
  #  }
  #end
  def all
    render :json=>{
      :success =>true,
      :result =>
      User.all.map do |user|
        {
          :phone_number=>user.phone_number,
          :borrow_card=>user.borrow_card
        }
      end
    }
  end
end
