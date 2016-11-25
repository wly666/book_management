class Tag <ActiveRecord::Base
  has_many :bookTags
  has_many :books, :through=>:bookTags
end
