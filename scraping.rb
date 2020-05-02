require 'csv'
require 'nokogiri'
require 'open-uri'
def fetch_bike(url)
  doc = Nokogiri::HTML(open(url))
  bike = {}
  doc.css('.bike-box > a > .bike-item').each do |node|
    category = node.css('.header > p').text
    bike[:category] = category
    image_url =  "https://www.giant.co.jp#{node.css('.image > img').attribute('src')}"
    bike[:image_url] = image_url
    name = node.css('.text > h3')[0].text.strip
    bike[:name] = name
    price = node.css('.text > p')[0].text
    bike[:price] = price
    description = node.css('.text > ul')[0].text
    bike[:description] = description
  end
  bike
end
urls = [
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA02&f_code=FD01&s_code=SR13',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA02&f_code=FD03&s_code=SR16',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA02&f_code=FD03&s_code=SR17',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA02&f_code=FD02&s_code=SR28',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA02&f_code=FD03&s_code=SR29',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD01&s_code=SR01',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD01&s_code=SR38',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD01&s_code=SR02',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD01&s_code=SR03',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD01&s_code=SR04',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD01&s_code=SR05',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD02&s_code=SR07',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD02&s_code=SR08',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD02&s_code=SR09',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD03&s_code=SR10',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD03&s_code=SR11',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD03&s_code=SR34',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD02&s_code=SR33',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD02&s_code=SR26',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD03&s_code=SR27',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD03&s_code=SR31',
  'https://www.giant.co.jp/giant20/bike_select.php?c_code=CA01&f_code=FD03&s_code=SR32'
]
CSV.open('file.csv', 'w') do |csv|
  csv << ["タイプ", "画像URL", "名前", "価格", "詳細"]
  urls.each do |url|
    bike = fetch_bike(url)
    csv << [bike[:category], bike[:image_url], bike[:name], bike[:price], bike[:description]]
  end
end


# doc.css('.bike-box > a > .bike-item > .header').each do |link|
#   puts "タイプ名: #{link.content}"
# end
# doc.css('.bike-box > a > .bike-item > .text > h3').each do |link|
#   puts "バイク名: #{link.text.strip}"
# end
# doc.css('.bike-box > a > .bike-item > .image > img').each do |link|
#   puts "画像URL: #{link.attribute('src')}"
# end