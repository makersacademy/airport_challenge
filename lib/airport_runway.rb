# require 'controller'
class AirportRunway

  def initialize
    @weather = true
  end

  def weather?
    @weather
  end

  def report_storm
    @weather = false
  end

end
