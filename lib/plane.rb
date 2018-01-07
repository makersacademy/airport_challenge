class Plane
   
  attr_reader :flying

  def initialize
    @flying = true
  end
   
  def land
    return raise("Already Grounded") unless @flying
    @flying = false
    true
  end

  def take_off
    return raise("Already Flying") if @flying
    @flying = true
  end
end
