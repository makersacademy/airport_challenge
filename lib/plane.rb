class Plane
  attr_reader :is_flying

  def initialize
    @is_flying = true
  end

  def land
    raise "Plane is at another airport, cannot land" unless @is_flying
    set_flying(false)
    "The plane has landed!"
  end

  def take_off
    set_flying(true)
    "The plane has taken off!"
  end

  private

  def set_flying(val)
    @is_flying = val
  end

end
