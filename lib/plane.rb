class Plane

attr_accessor :land, :airport

  def initialize
    @land = false
  end

  def instruct_land
    @land = true
  end

  def instruct_takeoff
    @land = false
  end

  def land?
    @land
  end
end
