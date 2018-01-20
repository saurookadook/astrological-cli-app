class Astrological::Sign
  attr_accessor :name, :daily, :daily_url, :weekly, :weekly_url, :monthly, :monthly_url, :yearly, :yearly_url

  def initialize(name = nil)
    @name = name
  end

  def self.scrape_sites
    pages = []

    pages << self.scrape_site_one
    # pages << self.scrape_site_two

    pages
  end

  def self.scrape_site_one # www.astrology-zodiac-signs.com/
    site_one_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/"))

    new_sign = self.new
    new_sign.name = site_one_signs.css("#zodiac-signs .tittle .portfolio-2").text

    site_one_sign_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/zodiac-signs/#{new_sign.name}"))
    # Figure out how to scrape info from 'data-w-tab="Totady"'
    binding.pry
    # new_sign.daily =
    # new_sign.daily_url =
    # new_sign.weekly =
    # new_sign.weekly_url =
    # new_sign.monthly =
    # new_sign.monthly_url =
    # new_sign.yearly =
    # new_sign.yearly_url =
  end

  def self.scrape_site_two # www.astrology.com/
  end

  # http://www.astrology-zodiac-signs.com/zodiac-sign/#{name}/
end
