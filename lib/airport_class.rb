class Airport

attr_accessor :planes

def initialize
  @planes = []
end

def land_plane
  if weather? == 'calm' && full? == false
    planes << Plane.new
  elsif weather? == 'stormy'
     "Landing delayed due to bad weather"
  else
     "Landing delayed due to airport capacity reached"
  end
end

def release_plane
  weather? == 'calm' ? planes.shift : "Takeoff delayed due to bad weather"
end

def airport_has_plane?
  planes == [] ? false : true
end

def weather?
  Weather.new.weather
end

def full?
  planes.length == 20
end

end
