require_relative 'plane'
class Airport

  attr_reader :terminal

  def initialize
    @terminal = []
  end

  def land(plane)
    fail 'cannot land'
    @terminal << plane; return 'landed safely'
  end

  def take_off
    fail 'cannot take off'
  end
end
