class Plane
  def takeoff
    raise 'Plane cannot takeoff: plane already flying' if flying?
  end

  def airport
    raise 'Plane cannot be at an airport: plane is already flying' if flying?
  end

  private

  def flying?
    true
  end
end
