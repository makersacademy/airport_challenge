require_relative 'airport'

class Plane
  attr_reader :flying

  def land
    raise "The plane has already landed" if @flying == false
    @flying = false
  end

  def taken_off
    raise "The plane has already taken off" if @flying == true
    @flying = true
  end

  def status
    if @flying == false
      "The plane has landed"
    elsif @flying == true
      "The plane has taken off"
    end
  end

end
