class Astrological::CLI

  attr_accessor :chosen_sign, :chosen_reading

  def call
    # Astrological::Scraper.new.sign_info
    puts "~>*<~ Welcome to Astrological! ~>*<~"
    start
  end

  def start
    sign_valid?
    reading_valid?
    current_readings
  end

  def sign_valid?
    puts ""
    puts "Which sign would you like to see more info about? Please enter one of the following:"
    puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
    sign_input = gets.strip.capitalize
    # Refactor with all signs kept in SIGNS_ARRAY constant and iterate over array to check for validity?
    if (sign_input == "Aquarius") || (sign_input == "Pisces") || (sign_input == "Aries") || (sign_input == "Taurus") || (sign_input == "Gemini") || (sign_input == "Cancer") || (sign_input == "Leo") || (sign_input == "Virgo") || (sign_input == "Libra") || (sign_input == "Scorpio") || (sign_input == "Sagittarius") || (sign_input == "Capricorn")
      @chosen_sign = sign_input
    else
      puts "I'm sorry, the heavens are confused. Please try again."
      sign_valid?
    end
  end

  def reading_valid?
    puts ""
    puts "Great! Now, which reading would you like to view? Please enter one of the following:"
    puts "daily / weekly / monthly / yearly"
    reading_input = gets.strip.downcase
    if (reading_input == "daily") || (reading_input == "weekly") || (reading_input == "monthly") || (reading_input == "yearly")
      @chosen_reading = reading_input
      # perhaps similar to above?
    else
      puts "I'm sorry, the expression you entered is invalid. Please try again."
      reading_valid?
    end
  end

  def current_readings
    puts "Here are the current #{@chosen_reading} readings for #{@chosen_sign}:"
    puts "1) "
  end

end
