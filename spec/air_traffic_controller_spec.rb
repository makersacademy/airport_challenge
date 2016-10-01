
require 'air_traffic_controller'

describe AirTrafficController do 

	it 'recognises when weather is stormy' do
		@air_traffic_controller = AirTrafficController.new

		expect(@air_traffic_controller).to respond_to :weather
	end 

end 



