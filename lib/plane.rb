class Plane

  def plane_arrives
    @at_airport = true
  end

  def plane_leaves
    @at_airport = false
  end

  def at_airport?
    @at_airport
  end

end