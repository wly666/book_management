class User <ActiveRecord::Base
  has_many :circulates

  has_secure_password
  validates_uniqueness_of :email
end
