class WeatherStation
  attr_reader :report
  def initialize(test_value = 'use_actual')
    test_value  == 'use_actual' ? @report = actual : @report = test_value
  end

  private
  
  def actual
      rand < 0.1 ? 'stormy' : 'sunny'
  end
end
