
class Airplane
  attr_accessor :landed

#We initialize the plane, the first thing we need is to know if the
#the plane is landed or not, so we will ask for that info, if the info is not given
#we will assume that the plane is not in land
  def initialize(landed = false)
    @landed = landed
  end

#If the airplane is landed, then flying? will return false
#If the airplane is not landed it means it is flying so it will return true
  def flying?
    !@landed
  end
end
