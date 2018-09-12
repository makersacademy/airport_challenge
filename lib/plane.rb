class Plane
  FLYING = true
  PLANE_CAPACITY = 100

  attr_reader :on_board, :flying, :plane_capacity

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
    passenger.boarded
    'Passenger on board!'
  end

  def disembark(passenger)
    fail 'Passenger already off the plane!' if on_board?(passenger) == false
    fail 'Plane is flying!' if flying?
    @on_board.delete(passenger)
    passenger.leave
    'Passenger has disembarked!'
  end
  
  def on_board?(passenger)
    @on_board.include?(passenger)
  end

  def plane_full?
    @on_board.count >= @plane_capacity
  end

  def takeoff
    @flying = true
  end

  def landed
    @flying = false
  end

  def flying?
    @flying
  end
end
