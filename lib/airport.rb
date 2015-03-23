class Airport

  def initialize
    @landed = []
    @capacity = 0
  end

  def land(plane)
    if weather == 5
      'There is a storm, landing denied'
    elsif weather != 5 && @capacity >= 10
      'Airport is full, landing denied'
    else
      @landed = @landed.push(plane.grounded)
      @capacity += 1
    end
  end

  def landed
    @landed
  end

  def weather
    @weather = rand(1..6)
  end

  def take_off(plane)
    @landed.delete(plane.flying)
    @capacity -= 1
  end

end
