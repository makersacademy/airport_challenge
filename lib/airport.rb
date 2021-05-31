require_relative 'plane'
require_relative 'weather'

class Airport 
  attr_accessor :full, :capacity
  
  DEFAULT = 50

  def initialize(capacity = DEFAULT)
    @capacity = capacity
  end

  def weather_ok?
    rand(10) != 9 ? true : false
  end
end