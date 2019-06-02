require_relative './weather.rb'

class Plane

  attr_reader :at_airport

  def initialize
    @at_airport = false
  end

  def in_hanger
    @at_airport = true
  end

  def not_in_hanger
    @at_airport = false
  end

end
