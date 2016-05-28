class Aeroplane
  attr_reader :to_land, :to_take_off
  def initialize
    @to_land = true
    @to_take_off = true
  end
  def landed?
    @to_land
  end
  def land(to_land)
    @to_land = true
  end
  def taken_off?
    @to_take_off
  end
  def take_off(to_take_off)
    @to_take_off = true
  end
end
