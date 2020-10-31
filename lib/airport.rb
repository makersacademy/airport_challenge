class Airport

  def initialize(default = 15)
    @hanger = []
    @capacity = default
  end

  attr_reader :hanger, :capacity

  def land(plane, weather)
    raise 'This plane is already in the airport!' if check(plane) == true

    return condition_error if weather == "It's stormy!"

    raise 'The airport is full!' if full?

    @hanger << plane
  end

  def take_off(weather)
    return condition_error if weather == "It's stormy!"

    raise 'There are no planes in the hanger!' if @hanger.empty?

    @hanger.pop
  end

  def check(plane)
    return true if @hanger.include? plane

    return false
  end

  private

  def condition_error
    raise "The conditions aren't good enough!"
  end

  def full?
    return false if @hanger.length < @capacity
    
    return true
  end

end
