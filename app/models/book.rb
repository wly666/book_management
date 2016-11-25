class Book <ActiveRecord::Base
  belongs_to :category
  has_many :bookTags
  has_many :tags, :through=>:bookTags
  has_many :circulates
end
