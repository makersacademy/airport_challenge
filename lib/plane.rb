class Plane

  attr_accessor :landed

  def landed?
    landed == true
  end

  def flying?
    landed == false
  end

end
