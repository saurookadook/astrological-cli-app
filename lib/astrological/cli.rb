class Astrological::CLI

  attr_accessor :chosen_sign, :chosen_reading

  def call
    # Astrological::Scraper.new.sign_info
    puts "~>*<~ Welcome to Astrological! ~>*<~"
    start
  end

  def start
    # puts ""
    # puts "Which sign would you like to see more info about? Please enter one of the following:"
    # puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
    sign_valid?
    reading_valid?

  end

  def sign_valid?
    puts ""
    puts "Which sign would you like to see more info about? Please enter one of the following:"
    puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
    sign_input = gets.strip.capitalize
    if sign_input == ("Aquarius" || "Pisces" || "Aries" || "Taurus" || "Gemini" || "Cancer" || "Leo" || "Virgo" || "Libra" || "Scorpio" || "Sagittarius" || "Capricorn")
      @chosen_sign = sign_input
    else
      puts "I'm sorry, the expression you entered is invalid. Please try again."
      sign_valid?
    end
  end

  def reading_valid?
    puts ""
    puts "Great! Now, which reading would you like to view? Please enter one of the following:"
    puts "daily / weekly / monthly / yearly"
    reading_input = gets.strip.downcase
    if reading_input == ("daily" || "weekly" || "monthly" || "yearly")
      @chosen_reading = reading_input
    else
      puts "I'm sorry, the expression you entered is invalid. Please try again."
      reading_valid?
    end
  end

end
