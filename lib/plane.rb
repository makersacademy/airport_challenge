class Plane
  attr_reader :flight
  alias_method :flight?, :flight

  def initialize
    @flight = 'flying'
  end

  def take_off!
    fail 'Plane is already flying!' if @flight == 'flying'
    @flight = 'flying'
  end

  def landing!
    fail 'Plane has already landed' if @flight == 'landed'
    @flight = 'landed'
  end
end
