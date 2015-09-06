class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_accessor :hanger

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
  end

  def instruct_to_take_off plane
    fail 'That plane is not in hanger' if hanger.include?(plane) == false
    hanger.delete plane
    plane.status = "flying"
  end

  def instruct_to_land plane
    fail 'Airport is full' if hanger.size == capacity
    fail 'Plane already in hanger' if hanger.include?(plane) == true
    hanger << plane
    plane.status = "landed"
  end

end
