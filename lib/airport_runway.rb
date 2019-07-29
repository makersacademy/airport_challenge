
class AirportRunway

  def initialize
    @weather = true
    @check = rand(27)
  end

  def stormcheck?
    @check == 13
  end

  def weather?
    @weather
  end

  def report_storm
    @weather = false
  end

end
