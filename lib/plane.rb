class Plane

  def initialize
    @landed
  end

  def land=(boolean) #setter, lands the plane
    @landed = boolean
  end

  def landed? #getter, checks the status if its landed
    @landed
  end

  def land
    self.land=(true)
  end

  def flying
    self.land=(false) #calling the landed= method on the instance of the class itself
  end

end
