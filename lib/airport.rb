require_relative "./plane"

class Airport

  def land(plane)
    fail "The hanger is full!" unless empty_hanger?
    @hanger = plane
  end
  
  def takeoff
    fail "The're no planes to take off in the hanger" if empty_hanger?

    @hanger = nil
  end


  def empty_hanger?
    return @hanger.nil?
  end

end
