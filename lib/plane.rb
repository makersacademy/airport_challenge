class Plane

  attr_reader :flying

  #initialize a new plane instance
  def initialize
    #@flying ivar stores the information whether the plane is in the air or not
    @flying = false #plane is on the ground as default
    @host_airport = "" #plane's host airport, if flying it should be nil
  end

  def land(airport)
    raise "#{self.class.name} is already on the ground" if landed?
    #airport's approval is needed for landing
    @flying = false #set the @flying ivar to false
  end

  def take_off(airport)
    raise "#{self.class.name} is already flying" if flying?
    #take_off is possible is airport == @host_airport
    @flying = true #set the @flying ivar to true
  end

  private
  def landed?
    !@flying
  end

  def flying?
    @flying
  end

end
