class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_accessor :hanger

  def initialize
    @capacity = DEFAULT_CAPACITY
    @hanger = []
  end

  def instruct_to_take_off plane
    hanger.delete plane
    plane.status = "flying"
  end

  def instruct_to_land plane
  end

end
