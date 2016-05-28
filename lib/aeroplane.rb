class Aeroplane
  attr_reader :to_land
  def initialize
    @to_land = true
  end
  def landed?
    @to_land
  end
  def land(to_land)
    @to_land = true
  end
end
