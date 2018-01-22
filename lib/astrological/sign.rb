class Astrological::Sign
  attr_accessor :name, :daily, :daily_url, :weekly, :weekly_url, :monthly, :monthly_url, :yearly, :yearly_url

  def initialize(name = nil)
    @name = name
  end

  def scrape_sites
    pages = []

    # pages << self.scrape_site_one
    pages << self.scrape_site_two

    pages
  end

  # def self.scrape_site_one # www.astrology-zodiac-signs.com/
  #   site_one_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/zodiac-signs/#{new_sign.name}"))
  #   # Figure out how to scrape info from 'data-w-tab="Totady"'
  #   binding.pry
  #   # new_sign.daily =
  #   # new_sign.daily_url =
  #   # new_sign.weekly =
  #   # new_sign.weekly_url =
  #   # new_sign.monthly =
  #   # new_sign.monthly_url =
  #   # new_sign.yearly =
  #   # new_sign.yearly_url =
  # end

  def scrape_site_two # cafeastrology.com/
    binding.pry
    site_two_daily_doc = Nokogiri::HTML(open("https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html"))
    # site_two_weekly_doc = Nokogiri::HTML(open("https://cafeastrology.com/thisweekinastrology.html"))
    site_two_monthly_doc = Nokogiri::HTML(open("https://cafeastrology.com/monthly#{@name.downcase}horoscope.html"))
    site_two_yearly_doc = Nokogiri::HTML(open("https://cafeastrology.com/2018-#{@name.downcase}-horoscope-overview.html")) # Pass in current year?

    @daily = site_two_daily_doc.css(".site-inner .entry-content tbody //tr[3] td").text.to_s[0...81]
    @daily_url = "https://cafeastrology.com/#{@name}dailyhoroscope.html"
    # # @weekly =
    # # @weekly_url =
    # @monthly =
    # @monthly_url =
    # @yearly =
    # @yearly_url =
  end

  # http://www.astrology-zodiac-signs.com/zodiac-sign/#{name}/
end
