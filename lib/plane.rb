class Plane
  FLYING = true
  PLANE_CAPACITY = 100

  attr_accessor :flying, :plane_capacity
  attr_reader :on_board

  def initialize(flying = FLYING, plane_capacity = PLANE_CAPACITY)
    @flying = flying
    @on_board = []
    @plane_capacity = plane_capacity
  end

  def board(passenger)
    fail 'Plane is full!' if plane_full?
    fail 'Passenger already on board!' if on_board?(passenger) == true
    fail 'Plane is flying!' if flying?
    fail 'Passenger does not have a ticket!' unless passenger.ticket?
    @on_board << passenger
  end

  def disembark(passenger)
    fail 'Passenger already off the plane!' if on_board?(passenger) == false
    fail 'Plane is flying!' if flying?
    @on_board.delete(passenger)
  end

  def on_board?(passenger)
    @on_board.include?(passenger)
  end

  def plane_full?
    @on_board.count >= @plane_capacity
  end

  def flying?
    @flying
  end
end
