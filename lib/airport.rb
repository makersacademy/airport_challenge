class Airport

  attr_accessor :planes_a

  def initialize
    @planes_a = []
  end

  def land(plane)
    if !@planes_a.include?(plane) && tell_weather() == "sunny" then
      @planes_a << plane
    end
  end

  def take_off(plane)
    tell_weather() == "sunny" ? @planes_a.delete(plane) : "the plane cannot take off"
  end

  def confirm_take_off(plane)
    if @planes_a.include?(plane) then
      return "#{plane} didn't take off"
    else
      return "#{plane} took off"
    end
  end

  def random
    1 + rand(6)
  end

  def tell_weather
    random() == 1 ? "stormy" : "sunny"
  end

end
