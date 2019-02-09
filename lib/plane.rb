class Plane
  def fly
    raise "This plane is already in flight" if @flying
    
    @flying = true
  end

  def isflying?
    @flying
  end

end
