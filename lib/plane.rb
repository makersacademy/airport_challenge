class Plane

  def land
    "The plane has landed!"
  end

  def take_off
    raise "Cannot take off in bad weather!" if status
    "The plane has taken off!"
  end

  def status
    false
  end
end
