class Plane

  #initialize a new plane instance
  def initialize
    #in the air or not
    @flying = true #plane is flying as default
  end

  def land
    fail "#{self.class.name} is already on the ground" unless flying?
    @flying = false #set the @flying ivar to false
  end

  def take_off
    fail "#{self.class.name} is already flying" if flying?
    @flying = true #set the @flying ivar to true
  end

  private
  def flying? #check if plane has taken off
    @flying
  end
end
