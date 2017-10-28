require './lib/plane.rb'

class Airport
  attr_reader :conditions, :plane

  def conditions
    @conditions = ['fine', 'stormy'].sample
  end

  def land
    if @conditions == 'stormy'
      "Cannot land due to stormy weather"
    else
      "Plane landed safely"
    end
  end

  def take_off
    if @conditions == 'stormy'
      "Cannot take off due to stormy weather"
    else
      "Plane has taken off safely"
    end
  end
end
