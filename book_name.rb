category_ids = []
File.open("/home/dengzhichao/workspace/wly/categories_ids.csv").each{|id| category_ids<<id.gsub(/\n/,"")}

log = Logger.new("/home/dengzhichao/workspace/wly/temp.csv")

category_ids.each do |category_id|
  Book.where("category_id = ? ", category_id).each{|book| log.info(book)}
end
