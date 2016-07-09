require 'weather'

describe WeatherReport do
it {is_expected.to respond_to(:weather_conditions)}
it {is_expected.to respond_to(:weather_gauge)}
#it 'is stormy under certain conditions' do
#end

end
