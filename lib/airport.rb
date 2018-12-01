class Airport

  def initialize (name, capacity, landed_planes)
    @name = name
    @capacity = capacity
    @landed_planes = landed_planes
  end

  attr_accessor :landed_planes

  def landing_possibility
    if @landed_planes >= @capacity
      "you cannot land"
    else
      "you can land"
    end
  end

end
