class Plane

  def initialize
    @flying = true
  end

  def take_off
    @flying = true
      return nil
  end

  def land
    @flying = false
      return nil
  end

  def flying?
    if @flying == true
      true
    else
      false
    end
  end

end
