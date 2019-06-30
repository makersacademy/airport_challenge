class Airport
attr_reader :stormy
attr_reader :capacity
DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
@hangar = []
@stormy = stormy
@capacity = capacity

  end

def land(plane)
  raise "hangar is full" if full?
  raise "too stormy to land" if @stormy
  @hangar.push(plane)


end

def take_off
 raise "hangar is empty" if @hangar.empty?
 raise "too stormy for take-off" if @stormy
 @hangar.pop
 return "plane has left the airport"

end

def check_weather
  todays_weather = rand
  report_storm if todays_weather == "stormy"

end

def report_storm
  @stormy = true
  end

private

def rand
random_weather = ["sunny", "sunny", "sunny", "sunny", "stormy"].sample
end

def full?
  @hangar.count >= @capacity ? true : false

end

end
