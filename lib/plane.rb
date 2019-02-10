class Plane

  attr_accessor :status

  def initialize
    @status = "Airbourne."
  end

  def land(where_to_land)
    where_to_land.hangar << self
    @status = "Landed."
  end

  def take_off
    @status = "Airbourne."
  end






end
