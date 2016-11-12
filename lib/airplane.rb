class Airplane

  def initialize
    @landed = true
  end


  def landed?
    @landed
  end

  def land!
    @landed = true
  end

  def take_off!
    @landed = false
  end

  def flying?
    !@landed
  end

end
