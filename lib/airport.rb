require_relative 'plane'

class Airport

def safe_conditions?(weather_report)
  @weather = weather_report
end

def clear?
  puts "Is the airway clear? Yes or No?"
    #unless gets.downcase.chomp == 'yes' || gets.downcase.chomp == 'no'
      #puts "Please answer yes or no"
    #end
  response = gets.chomp
  response.downcase == 'yes' ? (@clear = true) : (@clear = false)
  @clear
end

def land_plane(plane)
  fail "Unable to land due to stormy conditions" if @weather == 'stormy'
  @plane = plane
  puts @plane
  plane.landed?
end

def plane_depart
  fail "Unable to depart due to stormy conditions" if @weather == 'stormy'
  puts @plane
  @plane.departed?
end



end
