class Plane
  attr_reader :status
  
  def initialize
    @status = :landed
  end
  
  def land(airport)
    if @status == :flying
      if airport.ready_for_landing?
        @status = :landed
        airport.receive_plane(self)
        "Plane has landed"
      else
        raise "Cannot land"
      end
    else
      "Plane is already landed"
    end
  end
  
  def take_off(airport)
    if @status == :landed
      if airport.ready_for_taking_off?
        @status = :flying
        airport.release_plane(self)
      else
        raise "Cannot take off"
      end
    else
      "Plane is already flying"
    end
  end
end