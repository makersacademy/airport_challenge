require_relative 'plane'
require_relative 'weather_report'

class CONTROL_TOWER
  attr_accessor :capacity, :current_weather
  attr_reader   :airport, :planes

  DEFAULT_CAPACITY = 50
  @@new_line = "\n"

  def initialize(airport='Heathrow')
    @airport = airport
    @planes = []
    @capacity = DEFAULT_CAPACITY

    @current_weather = WEATHER_REPORT.new.report

    puts "Congratulations! #{@airport} Airport is now open!"
    puts
    puts "The current weather is #{@current_weather} so aircrafts are clear to land!" + @@new_line + "The #{airport} Control Tower will check the weather report when aircrafts want to land or take off. Hopefully it won't get stormy!" if @current_weather == 'clear'
    puts "The current weather is #{@current_weather} so aircrafts are not clear to land!" + @@new_line + "The #{airport} Control Tower will check the weather report when aircrafts want to land or take off. Hopefully it will clear up soon!" if @current_weather == 'stormy'
  end

  def storm?
    @current_weather = WEATHER_REPORT.new.report
  end

  def land(plane)
    return "This is #{self.airport} Control. Sorry #{plane.airline} flight, we have low visibility on the runway here at #{self.airport}, maintain holding formation till we can clear you to land. Over..." if current_weather == 'stormy'
    return "This is #{self.airport} Control. Sorry we already have a #{plane.airline} flight matching yours on the runway. Check you have your codes correct and we can clear you to land. Over..." if @planes.include? plane
    return 'AT CAPACITY' if full?
    return "This plane has already landed. Check your codes #{plane.airline}" if plane.flying == false
    plane.landed(@airport)
    @planes << plane

  end

  def take_off(plane)
    return "This is #{self.airport} Control. Sorry #{plane.airline} flight, we have low visibility on the runway here at #{self.airport}, maintain holding formation till we can clear you to land. Over..." if current_weather == 'stormy'
    return "This is #{self.airport} Control. Sorry we already cleared a #{plane.airline} flight matching yours and it is airborne. Check you have your codes correct and we can clear you to land. Over..." if plane.flying == true
    plane.take_off(@airport)
    @planes.pop if @planes.count > 0
  end

  def full?
    return true if @planes.count==DEFAULT_CAPACITY
  end
end
