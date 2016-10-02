
require './lib/air_traffic_controller'
require './lib/weather'

describe AirTrafficController do 

before :each do 
  @weather = Weather.new
  @bad_weather = Weather.new(false)
  @air_traffic_controller = AirTrafficController.new
  #@air_traffic_controller.responds_to(weather)
  #@weather.good_weather = Weather.new
end 

	it 'recognises when weather is not stormy' do
		expect(@air_traffic_controller.responds_to_weather(@weather)).to eq @weather
	end 

	it 'recognises when weather is stormy' do
		expect(@air_traffic_controller.responds_to_weather(@bad_weather)).to be @bad_weather
	end  

	it 'prevents take off when weather is stormy' do 
		expect(@air_traffic_controller).to respond_to :prevent_take_off

	end 
		
end 




