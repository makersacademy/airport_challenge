require_relative 'planes'
require_relative 'weather'

class TrafficController

  @@planes = Planes.new
  @@status = @@planes.planes_selector.values[1]
  @@plane_name = @@planes.planes_selector.values[0]
  @@airport_capacity = "full"

  def status
 
    if @@status == "grounded"
      print @@plane_name + " is " + @@status.to_s + "."
      return "grounded"
    else
      print @@plane_name + " is " + @@status.to_s + "."
      return "in air"
    end
    
  end

  def instruct
    # planes = Planes.new
    # status = planes.planes_selector.values[1]
    # plane_name = planes.planes_selector.values[0]

    if @@status == "grounded"
      print " Time to take off!"
      return "time to take off!"
    else
      print " Find an aiport to land at."
      return "find an aiport to land at"
    end
  end

  def check_capacity(capacity = @@airport_capacity)
    if capacity == "full"
      print " The airport is full! No landing here!"
      return "no landing here!"
    else
      print " The airport is clear!"
      return "Airport is clear!"
    end
  end

end

# weather = Weather.new 
# p weather.randomWeather
test = TrafficController.new
test.status
test.instruct
test.check_capacity