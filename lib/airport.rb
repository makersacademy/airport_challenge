class Airport
  require './lib/weather'
  DEFAULT_CAPACITY = 10
attr_reader :status, :take_off, :land, :departure_arr, :arrivals, :capacity, :conditions
attr_writer :capacity

def initialize (capacity=DEFAULT_CAPACITY, weather =Weather.new)
  @departure_arr =[]
  @arrivals=[]
  # @conditions = rand(10)
  @weather = weather
  @capacity = capacity
end

def land(plane)
  if @weather.stormy?
    print "Sorry it's too stormy to land right now"
  elsif full?
    print  "Sorry, the airport is full"
  else
    @landed_plane = plane
    @landed_plane.landed
    @arrivals << @landed_plane
    confirm_landed
  end
end

def confirm_landed
  print  @arrivals.length >= 1 ? "Plane has landed" : "Landing failed!"
end

def departures(plane)
  @departure_arr << plane
end

def take_off
  if @weather.stormy?
    print "sorry it's too stormy to fly today."
  else
  @inflight_plane = @departure_arr.pop
  @inflight_plane.airborne
  confirm_take_off
  end
end


def confirm_take_off
  print @departure_arr.length <= 0 ? "Plane has taken off" : "Take_off failed!"
end

private
def full?
  @arrivals.length >= @capacity
end

end
