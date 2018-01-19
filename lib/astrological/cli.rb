class Astrological::CLI

  def call
    # Astrological::Scraper.new.sign_info
    puts "~>*<~ Welcome to Astrological! ~>*<~"
    start
  end

  def start
    puts ""
    puts "Which sign would you like to see more info about? Please enter one of the following:"
    puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
  end

end
