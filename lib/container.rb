
module Container
  attr_accessor :capacity
  attr_reader :seats

  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @seats = []
    @capacity = capacity
  end

  def load(people=[Passenger.new])
    fail "Plane airbourne! What are we loading? Seagulls!" if flying?
    @people = people
    fail "Capacity reached!" if full?
    @seats.concat(people)
    self
  end

  def unload
    fail "Plane airbourne! You must be nuts!" if flying?
    leaving = @seats ||= []
    @seats = []
    leaving
  end

  def full?
    @people ||= []
    @people.size + @seats.size > @capacity
  end

  private

  def flying?
    @flying ||= false
  end
end