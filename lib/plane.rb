class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def ground
    @flying = false
  end

  def air
    @flying = true
  end
end

# Now that I've completed the 'stormy' stories and understand rspec a bit better,
# I might be able to use the above to detect whether a plane has landed or not.
# Unfortunately it's quite late and best saved for another time!