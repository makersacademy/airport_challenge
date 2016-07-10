require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :weather
  attr_reader :clear
  attr_reader :terminal
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @terminal = []
    @capacity = capacity
  end

def safe_conditions?(weather_report)
  @weather = weather_report
end

def clear?
  puts "Is the airway clear? Yes or No?"
  response = gets.chomp
  response.downcase == 'yes' ? (@clear = true) : (@clear = false)
  @clear
end

def land_plane(plane)
  fail "Unable to land due to stormy conditions" if @weather == 'stormy'
  fail "Airway not clear for landing" if @clear == false
  fail "Airport full, piss off!" if full?
  terminal << plane
  plane.landed?
end

def plane_depart
  fail "Unable to depart due to stormy conditions" if @weather == 'stormy'
  fail "Airway not clear for departure" if @clear == false
  plane = terminal.pop
  plane.departed?
end

  def full?
      @capacity <= @terminal.length
  end



end
