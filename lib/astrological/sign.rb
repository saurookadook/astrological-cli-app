class Astrological::Sign
  attr_accessor :daily, :daily_url, :monthly, :monthly_url, :yearly, :yearly_url

  @@all = []

  def initialize(readings_hash = nil)
   readings_hash.each {|k, v| self.send(("#{k}="), v)}
   @@all << self
  end

  def self.create_readings(readings_array)
    readings_array.each {|readings_hash| Astrological::Sign.new(readings_hash)}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end
