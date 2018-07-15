require_relative 'plane'

class Airport 
  attr_reader :hanger 
  attr_reader :weather 
  attr_accessor :capacity
  def initialize
    @capacity = 5
    @hanger = []
    @weather = :sunny
  end 

  def land(plane)
    fail "cannot land it is terrible weather for flying" if weather == :stormy 
    fail "This plane has already landed" if hanger.include? plane 
    fail "The hanger is full" if hanger.length == capacity
    @hanger << plane # in passes in the obj ref  <gibberish> not "boeing1"
    "plane has landed!"  
  end
  
  def takeoff(plane) 
    fail "cannot takeoff - poor weather" if weather == :stormy
    fail "plane cannot take off - not in hanger" unless hanger.include? plane
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
