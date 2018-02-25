class Plane

  def instruct_take_off
    raise 'Plane cannot take off. Plane is already flying'
  end

  def airport
    raise 'Plane cannot be at airport. Plane is already flying'
  end

end
