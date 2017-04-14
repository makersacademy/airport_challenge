require_relative 'plane'

class Airport

  attr_accessor :weather

  def initialize
    rand(1..10) >= 9 ? @weather = "Stormy" : @weather = "Sunny"
  end

end
