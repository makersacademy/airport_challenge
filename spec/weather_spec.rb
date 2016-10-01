require 'weather'

describe Weather do

  it 'responds to weather' do 
  	good_weather = Weather.new
  	expect(good_weather).to be good_weather
  end  
end