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
    sign_valid? unless (sign_valid? == true)
    # reading_valid? unless (reading_valid? == true)

  end

  def sign_valid?
    puts ""
    puts "Which sign would you like to see more info about? Please enter one of the following:"
    puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
    sign_input = gets.strip.capitalize
    if sign_input == ("Aquarius" || "Pisces" || "Aries" || "Taurus" || "Gemini" || "Cancer" || "Leo" || "Virgo" || "Libra" || "Scorpio" || "Sagittarius" || "Capricorn")
      true
    else
      puts "I'm sorry, please try again."
      sign_valid?
    end
  end

end
