require 'traffic_controller'
require 'airport'

describe TrafficController do 

  describe '.reqest_takeoff' do 
    it 'returns true when airport weather is not stormy' do
      airport = double()
      allow(airport).to receive(:allow_takeoff?).and_return(true)
      expect(subject.request_takeoff(airport)).to eq(true)
    end 
  end 
end 
