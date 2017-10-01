class Plane

  def taken_off
    @status = "Taken off"
  end

  def landed
    @status = 'Landed'
  end

  attr_accessor :status

end
