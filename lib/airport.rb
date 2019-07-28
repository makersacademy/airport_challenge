class Airport
  attr_accessor :number_of_landed_planes

  CAPACITY = 10

  def initialize
    @number_of_landed_planes = 0
  end

  def is_full?
    @number_of_landed_planes < capacity ? false : true
  end

  def capacity
    CAPACITY
  end
end