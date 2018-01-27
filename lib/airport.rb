class Airport

  attr_accessor :planes_collection

  def initialize
    @planes_collection = []
  end

  def land(plane)
    @planes_collection << plane
  end

  def take_off(plane)
    current_wheater = tell_weather()
    if current_wheater == "sunny"
      @planes_collection.delete(plane)
    else
      "It's stormy, the plane cannot take off"
    end
  end

  def confirm_take_off(plane)
    if @planes_collection.include?(plane) then
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
