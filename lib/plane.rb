class Plane

  attr_reader :flying  # => nil

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

end
