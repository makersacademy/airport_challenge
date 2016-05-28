
class Plane

  # def parked
  # 	true
  # end
  attr_reader :airport

  def landed
  	@airport = true
  end

  def taken_off
  	@airport = false
  end
 

end


