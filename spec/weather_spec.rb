require 'weather'

describe Weather do

  it 'responds to weather' do 
  	what_weather = Weather.new
  	expect(what_weather).to be what_weather
  end  
end