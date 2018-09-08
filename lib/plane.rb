class Plane
  FLYING = true
  PLANE_CAPACITY = 100

  attr_accessor :flying, :plane_capacity
  attr_reader :boarding

  def initialize(flying = FLYING, plane_capacity = PLANE_CAPACITY)
    @flying = flying
    @boarding = []
    @plane_capacity = plane_capacity
  end

  def board(passenger)
    fail 'Plane is full!' if plane_full?
    fail 'Passenger already on board!' if on_board?(passenger) == true
    fail 'Plane is flying!' if @flying
    @boarding << passenger
  end

  def on_board?(passenger)
    @boarding.include?(passenger)
  end

  def plane_full?
    @boarding.count >= @plane_capacity
  end

  def flying?
    @flying
  end
end
