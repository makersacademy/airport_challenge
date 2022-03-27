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

# Maybe use these to prevent plane from landing 
# in two seperate airports at once.