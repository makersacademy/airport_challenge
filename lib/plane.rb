require_relative "airport"

class Plane
  
  def land
    fail "The airport is full" if Airport.new.empty? == true

  end

  def take_off
  end

end
