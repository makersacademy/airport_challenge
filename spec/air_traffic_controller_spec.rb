
require 'air_traffic_controller'

describe AirTrafficController do 

before :each do 
  @weather = Weather.new
  @air_traffic_controller = AirTrafficController.new
end 

	it 'recognises when weather is stormy' do
	
		expect(@air_traffic_controller).to respond_to :weather
	end 
=begin
		it 'prevents landing when the weather is stormy' do

			expect(air_traffic_controller.stop_landing).to eq 

		end  
=end
end 



