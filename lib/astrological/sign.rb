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
    # new_sign.daily =
    # new_sign.daily_url =
    # new_sign.weekly =
    # new_sign.weekly_url =
    # new_sign.monthly =
    # new_sign.monthly_url =
    # new_sign.yearly =
    # new_sign.yearly_url =
  end

  def self.scrape_site_two # cafeastrology.com/
    daily_doc = Nokogiri::HTML(open("https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html", 'User-Agent' => 'firefox'))
    # weekly_doc = Nokogiri::HTML(open("https://cafeastrology.com/thisweekinastrology.html"))
    monthly_doc = Nokogiri::HTML(open("https://cafeastrology.com/monthly#{@name.downcase}horoscope.html", 'User-Agent' => 'firefox'))
    yearly_doc = Nokogiri::HTML(open("https://cafeastrology.com/2018-#{@name.downcase}-horoscope-overview.html", 'User-Agent' => 'firefox')) # Pass in current year?

    site_two_info = self.new
    # site_two_info.daily = daily_doc.css(".entry-content div[align='center'] table tbody tr")[2].css("td").text[0...65] # Still isn't scraping correctly
    site_two_info.daily_url = "https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html"
    site_two_info.monthly = monthly_doc.css(".entry-content .content-box-green p").text[0...65]
    site_two_info.monthly_url = "https://cafeastrology.com/monthly#{@name.downcase}horoscope.html"
    site_two_info.yearly = yearly_doc.css(".entry-content p")[10].text[0...65]
    site_two_info.yearly_url = "https://cafeastrology.com/2018-#{@name.downcase}-horoscope-overview.html"

    site_two_info
    # site_two_sign = self.new(@name)
    # site_two_sign.daily = daily_doc.css(".site-inner .entry-content tbody //tr[3] td").text[0...81]
    # site_two_sign.daily_url = "https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html"
    # # @weekly =
    # # @weekly_url =
    # @monthly =
    # @monthly_url =
    # @yearly =
    # @yearly_url =
  end

  def self.scrape_site_three # astrology.com
    daily_doc = Nokogiri::HTML(open("https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html", 'User-Agent' => 'firefox'))
    yearly_doc = Nokogiri::HTML(open("https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}", 'User-Agent' => 'firefox'))

    site_three_info = self.new
    site_three_info.daily = daily_doc.css(".horoscope .daily-horoscope p").text[0...65]
    site_three_info.daily_url = "https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html"
    site_three_info.monthly = nil
    site_three_info.monthly_url = nil
    site_three_info.yearly = yearly_doc.css(".horoscope .daily-horoscope #overview p").text[0...65]
    site_three_info.yearly_url = "https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}"

    site_three_info
    # site_three_sign = self.new(@name)
    # site_three_sign.daily = daily_doc.css(".horoscope .daily-horoscope p").text[0...81]
    # site_three_sign.daily_url = "https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html"
    # site_three_sign.yearly = yearly_doc.css(".horoscope .daily-horoscope #overview p").text[0...81]
    # site_three_sign.yearly_url = "https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}"
  end

end
