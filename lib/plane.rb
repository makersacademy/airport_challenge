class Plane

  def land(airport)
    if airport == "jfk"
      raise 'Landing prevented as airport is full'
    else
      "landed"
    end
  end

  def takeoff(airport)
    "flying"
  end

end
