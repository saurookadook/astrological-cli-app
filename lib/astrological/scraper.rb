class Astrological::Scraper
  attr_accessor :name, :current_year

  def self.scrape_sites(name)
    @name = name
    @current_year = Time.new.year
    sign_info = []

    sign_info << self.scrape_site_one
    sign_info << self.scrape_site_two
    sign_info << self.scrape_site_three

    sign_info
  end

  def self.scrape_site_one # www.astrology-zodiac-signs.com/
    daily_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/daily/"))
    monthly_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/monthly/"))
    yearly_doc = Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/#{@current_year}/"))

    site_one_info = {
      daily: daily_doc.css(".dailyHoroscope p").text[0...120],
      daily_url: "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/daily/",
      monthly: monthly_doc.css(".monthlyHoroscope p").text[0...120],
      monthly_url: "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/monthly/",
      yearly: yearly_doc.css(".astrology .headline-div-block p")[1].text[0...120],
      yearly_url: "http://www.astrology-zodiac-signs.com/horoscope/#{@name.downcase}/#{@current_year}/"
    }
  end

  def self.scrape_site_two # cafeastrology.com/
    daily_doc = Nokogiri::HTML(open("https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html", 'User-Agent' => 'chrome'))
    monthly_doc = Nokogiri::HTML(open("https://cafeastrology.com/monthly#{@name.downcase}horoscope.html", 'User-Agent' => 'chrome'))
    yearly_doc = Nokogiri::HTML(open("https://cafeastrology.com/#{@current_year}-#{@name.downcase}-horoscope-overview.html", 'User-Agent' => 'chrome'))

    site_two_info = {
      daily: "Your reading is lost amongst the stars",
      daily_url: "https://cafeastrology.com/#{@name.downcase}dailyhoroscope.html",
      monthly: monthly_doc.css(".entry-content .content-box-green p").text[0...120],
      monthly_url: "https://cafeastrology.com/monthly#{@name.downcase}horoscope.html",
      yearly: yearly_doc.css(".entry-content p")[10].text[0...120],
      yearly_url: "https://cafeastrology.com/#{@current_year}-#{@name.downcase}-horoscope-overview.html"
    }
  end

  def self.scrape_site_three # astrology.com
    daily_doc = Nokogiri::HTML(open("https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html", 'User-Agent' => 'chrome'))
    yearly_doc = Nokogiri::HTML(open("https://www.astrology.com/us/horoscope/yearly-overview-#{@current_year}.aspx?when=this-year&sign=#{@name.downcase}", 'User-Agent' => 'chrome'))

    site_three_info = {
      daily: daily_doc.css(".horoscope .daily-horoscope p").text[0...120],
      daily_url: "https://www.astrology.com/horoscope/daily/today/#{@name.downcase}.html",
      monthly: nil,
      monthly_url: nil,
      yearly: yearly_doc.css(".horoscope .daily-horoscope #overview p").text[0...120],
      yearly_url: "https://www.astrology.com/us/horoscope/yearly-overview-#{@current_year}.aspx?when=this-year&sign=#{@name.downcase}"
    }
  end

end
