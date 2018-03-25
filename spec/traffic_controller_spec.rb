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

  describe '.request landing' do 
    it 'returns true when airport is available' do
      airport = double()
      allow(airport).to receive(:allow_landing?).and_return(true)
      expect(subject.request_landing(airport)).to eq(true)
    end 

    it 'returns false when airport is not available' do 
      airport = double()
      allow(airport).to receive(:allow_landing?).and_return(false)
      expect(subject.request_landing(airport)).to eq(false)
    end 
  end 
end 
