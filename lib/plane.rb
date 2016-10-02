class Plane
  attr_reader :state
  def initialize
    @state = 'grounded'
  end

  def land
    @state = 'grounded'
  end

  def take_off
    @state = 'flying'
  end
end
