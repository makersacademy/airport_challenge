class Plane
  attr_reader :flying
  @flying = false
  def landed?
    @flying = false    
  end

  def taken_off?
    @flying = true
  end
end
