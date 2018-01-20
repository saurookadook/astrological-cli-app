class Astrological::Scraper

  def get_page_one
    Nokogiri::HTML(open("http://www.astrology-zodiac-signs.com/"))
  end

  def page_one_sign_names
    self.get_page_one.css("#zodiac-signs .tittle .portfolio-2").text
  end

  def page_one_readings
  end

  def get_page_two
  end
end
