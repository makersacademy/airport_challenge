module HelperMethodsModule

  def land_multiple_planes(planes)
    planes.times do
      plane = Plane.new
      subject.land(plane) if subject.weather == :sunny
    end
  end

  def takeoff_multiple_planes(planes)
    planes.times do
      subject.takeoff(subject.hangar[0]) if subject.weather == :sunny
    end
  end
end
