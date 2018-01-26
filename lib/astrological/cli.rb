class Astrological::CLI

  attr_accessor :chosen_sign, :chosen_reading

  def call
    puts "~>*<~ Welcome to Astrological! ~>*<~"
    start
  end

  def start
    choose_sign
    choose_reading
    gather_readings # Maybe?
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
    # puts "daily / weekly / monthly / yearly"
    puts "daily / monthly / yearly"
    reading_input = gets.strip.downcase
    if (reading_input == "daily") || (reading_input == "weekly") || (reading_input == "monthly") || (reading_input == "yearly")
      @chosen_reading = reading_input
    else
      puts "I'm sorry, the expression you entered is invalid. Please try again."
      choose_reading
    end
  end

  def gather_readings
    # creates instances of `Sign` class?
    # readings_array = Astrological::Scraper.scrape_sites(@chosen_sign)
  end

  def current_readings
    puts "Here are the current #{@chosen_reading} readings for #{@chosen_sign}:"
    sites = Astrological::Sign.new(@chosen_sign).all

    sites.each.with_index(1) do |sign_info, i|
      if @chosen_reading == "daily"
        puts ""
        puts "#{i}) #{sign_info.daily}..."
        puts "For more, visit: #{sign_info.daily_url}"
      # elsif @chosen_reading == "weekly"
      #   puts "#{i}) #{sign_info.weekly}... For more, visit: #{sign_info.weekly_url}"
      elsif @chosen_reading == "monthly"
        puts ""
        puts "#{i}) #{sign_info.monthly}..."
        puts "For more, visit: #{sign_info.monthly_url}" unless (sign_info.monthly == nil || sign_info.monthly_url == nil)
      elsif @chosen_reading == "yearly"
        puts ""
        puts "#{i}) #{sign_info.yearly}..."
        puts "For more, visit: #{sign_info.yearly_url}"
      end
    end
  end

  def another_reading?
    puts ""
    puts "What would you like to do next?"
    puts "If you'd like to view another reading for this sign, please enter: another reading"
    puts "If you'd like to view another reading for a different sign, please enter: different sign"
    puts "Or if you'd like to exit Astrolgical, please enter: exit"
    another_input = gets.strip.downcase
    if another_input == "another reading"
      choose_reading
      current_readings
      another_reading?
    elsif another_input == "different sign"
      start
    elsif another_input == "exit"
      puts "Thank you for using Astrological!"
    else
      puts "I'm sorry, the expression you entered is invalid. Please try again:"
      another_reading?
    end
  end

end


# case @chosen_reading
# when "daily"
#   @chosen_sign.scrape_site_one
#   puts "1) #{@chosen_sign.daily}... For more, visit: #{@chosen_sign.daily_url}"
#   @chosen_sign.scrape_site_two
#   puts "2) #{@chosen_sign.daily}... For more, visit: #{@chosen_sign.daily_url}"
#   @chosen_sign.scrape_site_three
#   puts "3) #{@chosen_sign.daily}... For more, visit: #{@chosen_sign.daily_url}"
# when "weekly"
#   @chosen_sign.scrape_site_one
#   puts "1) #{@chosen_sign.weekly}... For more, visit: #{@chosen_sign.weekly_url}"
#   @chosen_sign.scrape_site_two
#   puts "2) #{@chosen_sign.weekly}... For more, visit: #{@chosen_sign.weekly_url}"
#   @chosen_sign.scrape_site_three
#   puts "3) #{@chosen_sign.weekly}... For more, visit: #{@chosen_sign.weekly_url}"
# when "monthly"
#   @chosen_sign.scrape_site_one
#   puts "1) #{@chosen_sign.monthly}... For more, visit: #{@chosen_sign.monthly_url}"
#   @chosen_sign.scrape_site_two
#   puts "2) #{@chosen_sign.monthly}... For more, visit: #{@chosen_sign.monthly_url}"
#   @chosen_sign.scrape_site_three
#   puts "3) #{@chosen_sign.monthly}... For more, visit: #{@chosen_sign.monthly_url}"
# when "yearly"
#   @chosen_sign.scrape_site_one
#   puts "1) #{@chosen_sign.yearly}... For more, visit: #{@chosen_sign.yearly_url}"
#   @chosen_sign.scrape_site_two
#   puts "2) #{@chosen_sign.yearly}... For more, visit: #{@chosen_sign.yearly_url}"
#   @chosen_sign.scrape_site_three
#   puts "3) #{@chosen_sign.yearly}... For more, visit: #{@chosen_sign.yearly_url}"
# end

# use .each_with_index, similarly to the way Avi does in daily-deals
# and need to figure out better way to call reading period data
# binding.pry
