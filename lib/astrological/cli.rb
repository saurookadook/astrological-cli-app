class Astrological::CLI

  attr_accessor :chosen_sign, :chosen_reading

  def call
    # Astrological::Scraper.new.sign_info
    puts "~>*<~ Welcome to Astrological! ~>*<~"
    start
  end

  def start
    choose_sign
    choose_reading
    current_readings
    another_reading?
  end

  def choose_sign
    puts ""
    puts "Which sign would you like to see more info about? Please enter one of the following:"
    puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
    sign_input = gets.strip.capitalize
    # Refactor with all signs kept in SIGNS_ARRAY constant and iterate over array to check for validity?
    if (sign_input == "Aquarius") || (sign_input == "Pisces") || (sign_input == "Aries") || (sign_input == "Taurus") || (sign_input == "Gemini") || (sign_input == "Cancer") || (sign_input == "Leo") || (sign_input == "Virgo") || (sign_input == "Libra") || (sign_input == "Scorpio") || (sign_input == "Sagittarius") || (sign_input == "Capricorn")
      @chosen_sign = sign_input
    else
      puts "I'm sorry, the heavens are confused. Please try again."
      choose_sign
    end
  end

  def choose_reading
    puts ""
    puts "Great! Now, which reading would you like to view? Please enter one of the following:"
    puts "daily / weekly / monthly / yearly"
    reading_input = gets.strip.downcase
    if (reading_input == "daily") || (reading_input == "weekly") || (reading_input == "monthly") || (reading_input == "yearly")
      @chosen_reading = reading_input
      # perhaps similar to above?
    else
      puts "I'm sorry, the expression you entered is invalid. Please try again."
      choose_reading
    end
  end

  def current_readings
    puts "Here are the current #{@chosen_reading} readings for #{@chosen_sign}:"
    # @chosen_sign.scrape_site_one
    # puts "1) #{@chosen_sign.daily}... For more, visit: #{@chosen_sign.daily_url}"
    @chosen_sign.scrape_site_two
    puts "2) #{@chosen_sign.daily}... For more, visit: #{@chosen_sign.daily_url}"
  end

  def another_reading?
    puts "What would you like to do next?"
    puts "If you'd like to view another reading for this sign, please enter: another reading"
    puts "If you'd like to view another reading for a different sign, please enter: different sign"
    puts "Or if you'd like to exit Astrolgical, please enter: exit"
    another_input = gets.strip.downcase
    if another_input == "another reading"
      choose_reading
      # current_readings
      # another_reading?
    elsif another_input == "different sign"
      start
    end
  end

end
