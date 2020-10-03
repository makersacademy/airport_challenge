class Plane
  @flying = false
  def landed?
    @flying = false    
  end

  def taken_off?
    @flying = true
  end
end
