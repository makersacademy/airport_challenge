require_relative "airplane"

class Airport

  attr_reader :hangar
  attr_writer :size

  def initialize(size = 5)
    @hangar = []
    @size = size
  end

  def land(plane = Airplane.new)
    isfull?
    weather_check
    @hangar << plane
  end

  def takeoff
    weather_check
    @hangar.pop
  end

  def weather_check
    # 0: "stormy", 1: "sunny"
    @weather = [1, 1, 1, 1, 0].sample
    fail 'Cannot fly due to poor weather!' unless @weather == 1
  end

  def isfull?
    fail "The airport is full!" unless @hangar.size < @size
  end

end
