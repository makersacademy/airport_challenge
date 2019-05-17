class Airport
  attr_reader :base

  def initialize
    @base = []
  end

  def add(plane)
    plane.landed ? @base.push(plane) : raise {
      RuntimeError.new("This plane has not landed")
    }
  end

  def remove(plane)
    plane.take_off ? @base.delete(plane) : nil
  end
end
