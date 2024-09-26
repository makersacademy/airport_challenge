class Plane

  def initialize
    @flying = true
    @airport = true
  end

  def land(airport)
    raise 'Plane has already landed' if landed
    @flying = false
    @airport = true
  end

  def take_off
    raise 'Plane cannot take off when already flying' if flying
  end
  
  def airport
    raise 'Plane cannot be at airport when flying' if flying
  end
  
  private
  
  attr_reader :flying
  
  def airport
    landed
  end
  
  def flying
    !landed
  end
  
  def landed
    !flying
  end
end