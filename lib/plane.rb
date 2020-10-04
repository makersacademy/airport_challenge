class Plane
  attr_reader :flying
  @flying = false
  def landed?
    @flying = false    
  end

  def taken_off?
    @flying = true
    puts "A plane has taken off"
  end
end
