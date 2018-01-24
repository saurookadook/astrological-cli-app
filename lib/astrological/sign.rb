class Astrological::Sign
  attr_accessor :name, :daily, :daily_url, :weekly, :weekly_url, :monthly, :monthly_url, :yearly, :yearly_url

  def initialize(name = nil)
    @name = name
  end

  # def self.scrape_sites
  #   sign_info = []
  #
  #   # sign_info << self.scrape_site_one
  #   sign_info << self.scrape_site_two
  #   sign_info << self.scrape_site_three
  #
  #   sign_info
  # end

  def scrape_site_one # www.astrology-zodiac-signs.com/
    daily_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/daily/"))
    weekly_doc = Nokogiri::HTML(open(""))
    monthly_doc = Nokogiri::HTML(open(""))
    yearly_doc = Nokogiri::HTML(open(""))

    @daily = daily_doc.css(".dailyHoroscope p").text[0...81]
    @daily_url = "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/daily/"

    # new_sign.daily =
    # new_sign.daily_url =
    # new_sign.weekly =
    # new_sign.weekly_url =
    # new_sign.monthly =
    # new_sign.monthly_url =
    # new_sign.yearly =
    # new_sign.yearly_url =
  end

  def scrape_site_two # cafeastrology.com/
    daily_doc = Nokogiri::HTML(open("https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html", 'User-Agent' => 'firefox'))
    # weekly_doc = Nokogiri::HTML(open("https://cafeastrology.com/thisweekinastrology.html"))
    monthly_doc = Nokogiri::HTML(open("https://cafeastrology.com/monthly#{@name.downcase}horoscope.html", 'User-Agent' => 'firefox'))
    yearly_doc = Nokogiri::HTML(open("https://cafeastrology.com/2018-#{@name.downcase}-horoscope-overview.html", 'User-Agent' => 'firefox')) # Pass in current year?

    @daily = daily_doc.css(".site-inner .entry-content tbody //tr[3] td").text[0...81]
    @daily_url = "https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html"

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

  def scrape_site_three # astrology.com
    daily_doc = Nokogiri::HTML(open("https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html", 'User-Agent' => 'firefox'))
    yearly_doc = Nokogiri::HTML(open("https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}", 'User-Agent' => 'firefox'))

    @daily = daily_doc.css(".horoscope .daily-horoscope p").text[0...81]
    @daily_url = "https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html"
    @yearly = yearly_doc.css(".horoscope .daily-horoscope #overview p").text[0...81]
    @yearly_url = "https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}"

    # site_three_sign = self.new(@name)
    # site_three_sign.daily = daily_doc.css(".horoscope .daily-horoscope p").text[0...81]
    # site_three_sign.daily_url = "https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html"
    # site_three_sign.yearly = yearly_doc.css(".horoscope .daily-horoscope #overview p").text[0...81]
    # site_three_sign.yearly_url = "https://www.astrology.com/us/horoscope/yearly-overview-2018.aspx?when=this-year&sign=#{@name.downcase}"
  end

end
