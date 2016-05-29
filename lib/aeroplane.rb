require './lib/weather'
require './lib/airport'

class Aeroplane
  attr_reader :to_land, :to_take_off

  def initialize
    @to_land = true
    @to_take_off = true
  end

  def landed?
    @to_land
  end

  def land(wobj, full = false)
    wobj.stormy? || full == true ? @to_land = false : @to_land = true
    @to_land
  end

  def taken_off?
    @to_take_off
  end

  def take_off(wobj)
    wobj.stormy? ? @to_take_off = false : @to_take_off = true
    @to_take_off
  end

end
