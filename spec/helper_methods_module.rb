module HelperMethodsModule

  def land
    weather(:sunny)
    subject.land(plane)
  end

  def land_and_takeoff 
    land
    subject.takeoff(plane)
  end

  def attempt_landing(airport)
    airport.weather = :sunny
    2.times { airport.land(plane) }
  end

  def weather(type)
    weather_test = double
    case type
      when :sunny then allow(weather_test).to receive(:status).and_return(:sunny)
      when :stormy then allow(weather_test).to receive(:status).and_return(:stormy)
    end
    subject.weather = weather_test.status
  end

  def land_multiple_planes(planes)
    planes.times do
      plane = Plane.new
      subject.weather = Weather.new.status
      subject.land(plane) if subject.weather == :sunny
    end
  end

  def takeoff_multiple_planes(planes)
    planes.times do
      weather = Weather.new
      subject.takeoff(plane) if weather == :sunny
    end
  end
end
