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
    count = 0
    planes.times do
      plane = Plane.new
      subject.weather = Weather.new.status
      count += 1 if subject.weather == :sunny
      subject.land(plane)
    end
    count
  end

  def takeoff_multiple_planes
    count = 0
    subject.hangar.each do |plane|
      weather = Weather.new
      count += 1 if weather == :sunny
      subject.takeoff(plane)
    end
    count
  end
end
