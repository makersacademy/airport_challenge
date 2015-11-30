class Plane

  attr_reader :confirmation

  def status(status = "in air")
    @confirmation = status
  end

end
