class Plane

  attr_accessor :flying, :in_airport

  def initialize
    @flying = true
    @in_airport = false
  end

  def flying?
    flying
  end

  def in_airport?
    in_airport
  end

end
