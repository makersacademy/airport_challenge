
require './lib/air_traffic_controller'
require './lib/weather'

describe AirTrafficController do 
before :each do 
 @air_traffic_controller = AirTrafficController.new
 @good_weather=Weather.new
 #@good_weather = double(:good_weather)
 #allow(@good_weather).to receive(@air_traffic_control.responds_to_weather).and_return(true)
 #@bad_weather = double(:bad_weather)
# allow(@bad_weather).to receive(@air_traffic_control.responds_to_weather).and_return(false)
 #@air_traffic_controller.responds_to_weather = AirTrafficController.new
  #@air_traffic_controller.responds_to(weather)
  #@weather.good_weather = Weather.new
	end 

	it {is_expected.to respond_to :responds_to_weather} 
		

	it 'recognises when weather is not stormy' do
		expect(@air_traffic_controller.responds_to_weather(@good_weather)).to be @good_weather
	end 

	it 'recognises when weather is stormy' do
		expect(@air_traffic_controller.responds_to_weather(@bad_weather)).to be @bad_weather
	end  

	it {is_expected.to respond_to :prevent_take_off} 

	it 'raises an exception when planes try to take off if the weather is stormy' do 
		expect(@air_traffic_controller.prevent_take_off(@weather)).to eq "Cancelled due to weather"
	end
		
end 




