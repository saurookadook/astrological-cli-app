# class Astrological::SiteThreeReading
#   attr_accessor :sign_name, :daily, :daily_url, :weekly, :weekly_url, :monthly, :monthly_url, :yearly, :yearly_url
#
#   def initialize(sign_name = nil)
#     @sign_name = sign_name
#   end
#
#   def scrape_site_three
#     site_three_daily_doc = Nokogiri::HTML(open("https://www.astrology.com/horoscope/daily/today/#{@name}.html", 'User-Agent' => 'firefox'))
#     # site_three_yearly_doc =
#
#     @daily = site_three_daily_doc.css(".horoscope .daily-horoscope p").text
#     @daily_url = "https://www.astrology.com/horoscope/daily/today/#{@name}.html"
#   end
#
# end
