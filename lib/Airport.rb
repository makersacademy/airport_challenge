class Airport
attr_reader :stormy

  def initialize
@hangar = []
@stormy = stormy
  end

def land(plane)
  @hangar.push(plane)

end

def take_off
 raise "hangar is empty" if @hangar.empty?
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

def rand
random_weather = ["sunny", "sunny", "sunny", "sunny", "stormy"].sample
end

end
