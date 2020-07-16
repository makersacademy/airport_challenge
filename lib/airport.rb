# I needed quite a bit of help from Tatsiana setting up the environment,
# managed to install new version of ruby ok but needed to update bundler too
# which I didn't pick up from the error message
class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :plane
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = 0
    @capacity = capacity
  end

  def land(plane)
    if stormy? == true
      raise "Weather is stormy, you cannot land here"
    end
    if full?
      raise "This airport is full, you can't land here!"
    end

    @plane += 1
  end

  def take_off(plane)
    if stormy? == true
      raise "Weather is stormy, you cannot take off"
    end
    if empty?
      raise "There are no planes to take off!"
    end

    @plane -= 1
  end

  # Please note for "stormy?" method below I haven't worked out how to use doubles successfully yet,
  # but I tested all code in repl.it and it works there, and I tested the below with
  # just "return true" and "return false", and the correct tests seemed to pass/fail each time
  def stormy?
    if rand(10).zero?
      return true
    end

    return false
  end

private
  def full?
    if @plane == capacity
      return true
    end

    return false
  end

  def empty?
    if @plane.zero?
      return true
    end

    return false
  end
end

class Plane
  def initialize
  end
end
