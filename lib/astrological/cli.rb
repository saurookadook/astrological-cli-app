class Astrological::CLI
  attr_accessor :chosen_sign, :chosen_reading

  ALL_SIGNS = [
    "Aquarius",
    "Pisces",
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
    "Capricorn"
  ]

  READING_TIMES = [
    "daily",
    "monthly",
    "yearly"
  ]

  def call
    puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
    puts "~>*<~    Welcome to Astrological!   ~>*<~"
    puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
    start
  end

  def start
    choose_sign
    choose_reading
    gather_readings
    current_readings
    another_reading?
  end

  def choose_sign
    puts ""
    puts "Which sign would you like to see more info about? Please enter one of the following:"
    puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
    puts "Aquarius / Pisces / Aries / Taurus / Gemini / Cancer / Leo / Virgo / Libra / Scorpio / Sagittarius / Capricorn"
    sign_input = gets.strip.capitalize
    if ALL_SIGNS.include?(sign_input)
      @chosen_sign = sign_input
    else
      puts "I'm sorry, the cosmos does not recognize that expression. Please try again."
      choose_sign
    end
  end

  def choose_reading
    puts ""
    puts "Great! Now, which reading would you like to view? Please enter one of the following:"
    puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
    puts "daily / monthly / yearly"
    reading_input = gets.strip.downcase
    if READING_TIMES.include?(reading_input)
      @chosen_reading = reading_input
    else
      puts "I'm sorry, the cosmos does not recognize that expression. Please try again."
      choose_reading
    end
  end

  def gather_readings
    readings_array = Astrological::Scraper.scrape_sites(@chosen_sign)
    Astrological::Sign.create_readings(readings_array)
  end

  def current_readings
    puts "Here are the current #{@chosen_reading} readings for #{@chosen_sign}:"
    Astrological::Sign.all.each.with_index(1) do |sign_info, i|
      if @chosen_reading == "daily"
        puts ""
        puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
        puts "#{i}) #{sign_info.daily}..."
        puts "For more, visit: #{sign_info.daily_url}"
        puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
      elsif @chosen_reading == "monthly"
        if !(sign_info.monthly == nil || sign_info.monthly_url == nil)
          puts ""
          puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
          puts "#{i}) #{sign_info.monthly}..."
          puts "For more, visit: #{sign_info.monthly_url}"
          puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
        end
      elsif @chosen_reading == "yearly"
        puts ""
        puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
        puts "#{i}) #{sign_info.yearly}..."
        puts "For more, visit: #{sign_info.yearly_url}"
        puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
      end
    end
  end

  def another_reading?
    puts ""
    puts "What would you like to do next?"
    puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
    puts "If you'd like to view another reading for this sign, please enter: another reading"
    puts "If you'd like to view another reading for a different sign, please enter: different sign"
    puts "Or if you'd like to exit Astrolgical, please enter: exit"
    another_input = gets.strip.downcase
    if another_input == "another reading"
      choose_reading
      current_readings
      another_reading?
    elsif another_input == "different sign"
      Astrological::Sign.reset_all
      start
    elsif another_input == "exit"
      puts ""
      puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
      puts "~>*<~  Thank you for using Astrological!  ~>*<~"
      puts "~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~ ~>*<~"
    else
      puts "I'm sorry, the cosmos does not recognize that expression. Please try again:"
      another_reading?
    end
  end

end
