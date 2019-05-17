class Airport
  attr_reader :base

  def initialize
    @base = []
  end

  def add(plane)
    if @base.length >= 50 || !plane.land
      raise {
        RuntimeError.new("This plane has not landed")
      }
    else
      @base.push(plane)
    end
  end

  def remove(plane)
    plane.take_off ? @base.delete(plane) : nil
  end
end
