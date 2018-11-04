class Airport

  attr_reader :plane_in_airports

  def initialize
    @plane_in_airport = true
  end

  def instruct_land
    @plane_in_airport = true
  end

  def instruct_take_off
    @plane_in_airport = false
  end

  def plane_is_in_airport
    @plane_in_airport
  end


end
