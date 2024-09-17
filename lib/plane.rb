class Plane

  attr_accessor :in_airport

  def initialize
    @in_airport = false
  end

  def landing?
    @in_airport
  end

end
