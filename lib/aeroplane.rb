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
    if (wobj.is_stormy? || full == true)
      @to_land = false
    else
      @to_land = true
    end
    @to_land
  end

  def taken_off?
    @to_take_off
  end

  def take_off(wobj)
    if (wobj.is_stormy?)
      @to_take_off = false
    else
      @to_take_off = true
    end
    @to_take_off
  end

end
