class Plane

  attr_reader :capacity
  attr_reader :people

  def initialize(capacity = DEFAULT_CAPACITY)
    @people = []
    @landed = true
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 50

  def full?
    @people.length == @capacity ? true : false
  end

  def landed?
    @landed
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end

  def board(passenger)
    @people << passenger
    space
  end

  def space
    @space = @capacity - @people.count
  end
end
