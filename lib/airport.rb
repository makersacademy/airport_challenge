class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_accessor :hanger
  attr_accessor :weather

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
    @weather = "sunny"
  end

  def instruct_to_take_off plane
    weather = "stormy" if rand(21) == 1
    fail 'Cannot take off in stormy weather' if weather == "stormy"
    fail 'That plane is not in hanger' if hanger.include?(plane) == false
    hanger.delete plane
    plane.status = "flying"
  end

  def instruct_to_land plane
    weather = "stormy" if rand(21) == 1
    fail 'Cannot land in stormy weather' if weather == "stormy"
    fail 'Airport is full' if hanger.size == capacity
    fail 'Plane already in hanger' if hanger.include?(plane) == true
    hanger << plane
    plane.status = "landed"
  end

end
