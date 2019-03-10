module HelperMethodsModule

  def weather(type)
    weather_test = double
    case type
      when :sunny then allow(weather_test).to receive(:status).and_return(:sunny)
      when :stormy then allow(weather_test).to receive(:status).and_return(:stormy)
    end
    subject.weather = weather_test.status
  end

  def land_multiple_planes(airport, planes)
    count = 0
    planes.times do
      plane = Plane.new
      airport.weather = Weather.new.status
      count += 1 if airport.weather == :sunny
      airport.land(plane)
    end
    count
  end

  def takeoff_multiple_planes(airport)
    count = 0
    airport.hangar.each do |plane|
      weather = Weather.new
      count += 1 if weather == :sunny
      airport.takeoff(plane)
    end
    count
  end

end
