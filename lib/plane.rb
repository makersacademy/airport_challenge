class Plane

  def initialize
    @flying = true
  end

  def status?
    if @flying
      :airborne
    else
      :landed
    end
  end

  def flying?
    @flying
  end

  def land
    @flying = false
    "Please take your seats and prepare for landing"
  end

  def take_off
    @flying = true
    "Buckle up folks I havent flown in a while"
  end


end
      # => nil
