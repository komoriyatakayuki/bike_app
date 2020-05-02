require 'csv'

csv = CSV.read('file.csv')
csv.each do |bike|
  category = bike[0]
  image_url = bike[1]
  name = bike[2]
  price = bike[3]
  description = bike[4]

  Bike.seed(:id) do |s|
    s.category = category
    s.image_url = image_url
    s.name = name
    s.price = price
    s.description = description
  end
end