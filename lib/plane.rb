class Plane

  def land(landing_at)
    if landing_at.weather == 'good'
      check_for_duplicate(landing_at)
      raise Exception.new("Don't do it captain, we don't have power!")
    end
  end

  def check_for_duplicate(landing_at)
    if landing_at.hangar.include? self
      raise Exception.new("That plane has already landed at the airport.")
    elsif landing_at.hangar.length >= landing_at.capacity
      raise Exception.new("There's no room at the hangar.")
    else landing_at.hangar.push(self)
    end
  end

  def take_off(from)
    if from.weather == 'good'
      find_plane(from)
    else
      raise Exception.new("Are you mad! It's stormy outside!")
    end
  end

  def find_plane(from)
    if from.hangar.include? self
      from.hangar.delete(self)
    else
      raise Exception.new("That plane is not in the hangar.")
    end
  end
end
