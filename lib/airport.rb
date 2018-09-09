class Airport
  attr_reader :storage

  def initialize
    @weather = "sunny" #I set it up as always stormy as if condition failed my rspec.
    @storage = []
  end

  def land(plane)
    plane = Plane.new
    @storage << plane
  end

  def take_off(plane)
    if @weather == "stormy"
      raise RuntimeError
    else
      @storage.delete_at(-1)
    end
  end

end
