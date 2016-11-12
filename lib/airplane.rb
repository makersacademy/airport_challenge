class Airplane

  def initialize
    @landed = true
  end


  def landed?
    @landed
  end

  def land!(weather)
    @landed = true unless weather.condition == "Stormy"
  end

  def take_off!(weather)
    @landed = false unless weather.condition == "Stormy"
  end

  def flying?
    !@landed
  end

end
