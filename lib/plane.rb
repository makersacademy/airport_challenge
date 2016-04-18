class Plane

  def initialize(weather, airport)
    @weather = weather
    @airport = airport
  end

  def land; end

  def landed?
    return false if weather.stormy? || airport.full?
    true
  end

  def take_off(weather); end

  def taken_off?
    weather.stormy? ? false : true
  end

  private

    attr_reader :weather, :airport
  
end