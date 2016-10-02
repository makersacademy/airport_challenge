class Airport
  DEFAULT_CAPACITY = 10
attr_reader :status, :take_off, :land, :departure_arr, :arrivals

def initialize (capacity=DEFAULT_CAPACITY)
  @departure_arr =[]
  @arrivals=[]
  # @conditions = rand(10)
  @conditions = 4
  @capacity = capacity
end

def land(plane)
  if @conditions < 3
    print "Sorry it's too stormy to land right now"
  elsif @arrivals.length >= @capacity
    print "Sorry, the airport is full"
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
  if @conditions >= 3
  @inflight_plane = @departure_arr.pop
  @inflight_plane.airborne
  confirm_take_off
  else
    print "sorry it's too stormy to fly today."
  end
end

def confirm_take_off
  print @departure_arr.length <= 0 ? "Plane has taken off" : "Take_off failed!"
end


end
