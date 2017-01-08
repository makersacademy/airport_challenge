class Plane
  attr_accessor :status # we should be able to read and change(write) the status

  def land
    @status = 'landed'
  end

  def take_off
    @status = 'took off'
  end

end
