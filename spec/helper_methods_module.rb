module HelperMethodsModule

  def weather(type)
    weather_test = double
    case type
      when :sunny then allow(weather_test).to receive(:status).and_return(:sunny)
      when :stormy then allow(weather_test).to receive(:status).and_return(:stormy)
    end
    subject.weather = weather_test.status
  end

end
