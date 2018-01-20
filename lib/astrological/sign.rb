class Astrological::Sign
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  # http://www.astrology-zodiac-signs.com/zodiac-sign/#{name}/
end
