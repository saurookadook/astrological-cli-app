class Astrological::Sign
  attr_accessor :name, :daily, :daily_url, :weekly, :weekly_url, :monthly, :monthly_url, :yearly, :yearly_url

  # def initialize(name = nil)
  #   @name = name
  # end

  def self.scrape_sites(name)
    @name = name
    sign_info = []

    sign_info << self.scrape_site_one
    sign_info << self.scrape_site_two
    sign_info << self.scrape_site_three

    sign_info
  end

  def self.scrape_site_one # www.astrology-zodiac-signs.com/
    daily_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/daily/"))
    # weekly_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/weekly/"))
    monthly_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/monthly/"))
    yearly_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/2018/")) # Use current year instead?

    site_one_info = self.new
    site_one_info.daily = daily_doc.css(".dailyHoroscope p").text[0...65]
    site_one_info.daily_url = "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/daily/"
    # site_one_info.weekly = weekly_doc.css(".weeklyHoroscope p").text[0...65]
    # site_one_info.weekly_url = "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/weekly/"
    site_one_info.monthly = monthly_doc.css(".monthlyHoroscope p").text[0...65]
    site_one_info.monthly_url = "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/monthly/"
    site_one_info.yearly = yearly_doc.css(".astrology .headline-div-block p")[1].text[0...65]
    site_one_info.yearly_url = "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/2018/"

    site_one_info
  end

  def self.scrape_site_two # cafeastrology.com/
    daily_doc = Nokogiri::HTML(open("https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html", 'User-Agent' => 'chrome'))
    # weekly_doc = Nokogiri::HTML(open("https://cafeastrology.com/thisweekinastrology.html"))
    monthly_doc = Nokogiri::HTML(open("https://cafeastrology.com/monthly#{@name.downcase}horoscope.html", 'User-Agent' => 'chrome'))
    yearly_doc = Nokogiri::HTML(open("https://cafeastrology.com/2018-#{@name.downcase}-horoscope-overview.html", 'User-Agent' => 'chrome')) # Pass in current year?

    site_two_info = self.new
    # site_two_info.daily = daily_doc.css(".entry-content div[align='center'] table tbody tr")[2].css("td").text[0...65] # Still isn't scraping correctly
    site_two_info.daily_url = "https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html"
    site_two_info.monthly = monthly_doc.css(".entry-content .content-box-green p").text[0...65] # Not scraping correctly
    site_two_info.monthly_url = "https://cafeastrology.com/monthly#{@name.downcase}horoscope.html"
    site_two_info.yearly = yearly_doc.css(".entry-content p")[10].text[0...65]
    site_two_info.yearly_url = "https://cafeastrology.com/2018-#{@name.downcase}-horoscope-overview.html"

    site_two_info
  end

  def self.scrape_site_three # astrology.com
    daily_doc = Nokogiri::HTML(open("https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html", 'User-Agent' => 'chrome'))
    yearly_doc = Nokogiri::HTML(open("https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}", 'User-Agent' => 'chrome'))

    site_three_info = self.new
    site_three_info.daily = daily_doc.css(".horoscope .daily-horoscope p").text[0...65]
    site_three_info.daily_url = "https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html"
    site_three_info.monthly = nil
    site_three_info.monthly_url = nil
    site_three_info.yearly = yearly_doc.css(".horoscope .daily-horoscope #overview p").text[0...65]
    site_three_info.yearly_url = "https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}"

    site_three_info
  end

end
