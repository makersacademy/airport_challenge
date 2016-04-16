class Plane
  attr_reader :status
  
  def initialize
    @status = :landed
  end
  
  def land
    if @status == :flying
      @status = :landed
    else
      "Plane is already landed"
    end
  end
  
  def take_off
    if @status == :landed
      @status = :flying
    else
      "Plane is already flying"
    end
  end
end