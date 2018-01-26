class Astrological::Sign
  # attr_accessor :name, :site_one_reading, :site_two_reading, :site_three_reading
  attr_accessor :name, :daily, :daily_url, :weekly, :weekly_url, :monthly, :monthly_url, :yearly, :yearly_url

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

end
