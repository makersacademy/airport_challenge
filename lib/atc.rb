require_relative 'plane'

class Airport

def initialize
  @weather = ["stormy","sunny"].sample
  puts "Weather conditions today: #{@weather}"
  @runways = []
  @free_runways = 3
end
# an extra method so i can change the weather without exiting and reloading irb
def random_weather
  @weather = ["stormy", "sunny"].sample
  puts @weather
end

def plane_land(plane)
  if check_weather == false
    raise StandardError.new "Plane cannot land"
  elsif check_runways == false
    raise StandardError.new "Plane cannot land"
  elsif plane_present(plane) == true
    raise StandardError.new "Plane already landed"
  else
    puts "Cleared for landing..."
    puts "#{plane} has landed."
    @runways.push(plane)
    puts "There are now #{@free_runways-=1} free runways"
    puts @runways
  end
end

def plane_takeoff(plane)
  if check_weather == false
    raise StandardError.new "Plane delayed"
  elsif plane_not_present(plane) == true
    raise StandardError.new "Plane already left the airport"
  else
    puts "Cleared for take-off!"
    @runways.pop
    puts "#{plane} is airbourne"
    puts "There are now #{@free_runways+=1} free runways"
    puts @runways
  end
end

def check_weather
  if @weather == "stormy"
    return false
  else
    return true
  end
end

def check_runways
  if @free_runways == 0
    return false
  else
    return true
  end
end

def plane_present(plane)
  if plane == @runways[0]
    return true
  elsif plane == @runways[1]
    return true
  end
end

def plane_not_present(plane) # something wrong here - says plane left when it hasn't
  if plane != @runways[0]
    return true
  elsif plane != @runways[1]
    return true
  elsif plane != @runways[2]
    return true
  end
end

def planes
  puts @runways
end

end
