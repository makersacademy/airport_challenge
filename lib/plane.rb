
class Plane

  def initialize
    @flying = true
  end

  def land
    fail 'Plane is already landed' if !@flying
    @flying = false
  end 

  def take_off
    fail 'Plane is already flying' if @flying  
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

end


# class Plane

#   def initialize
#     @flying = true
#   end

#   def flying?
#     @flying
#   end

#   def landed?
#     !@flying
#   end

#   def land
#     @flying ? @flying = false : (fail 'Plane has already landed')
#   end

#   def take_off
#     !@flying ? @flying = true : (fail 'Plane is already flying')
#   end

# end


