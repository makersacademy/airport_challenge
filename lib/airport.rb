class Airport
attr_reader :status, :take_off, :land, :departure_arr, :arrivals

def initialize
  @departure_arr =[]
  @arrivals=[]
  @conditions = rand(10)

end

def land(plane)
  if @conditions >=3
  @landed_plane = plane
  @landed_plane.landed
  @arrivals << @landed_plane
  confirm_landed
  else
  print "Sorry it's too stormy to land right now"
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
