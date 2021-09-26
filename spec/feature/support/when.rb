def when_the_weather_is_clear
  allow(@weather_service).to receive(:weather_report).and_return :clear
end