require 'Plane.rb'
#require 'Weather.rb'

describe Plane do
  let(:airport) {double :airport}
  let(:weather) {double :weather}


    it 'allows planes to land at a specific Airport' do
      allow(weather).to receive(:stormy?).and_return(false) # this means weather is good

      subject.land_at(airport, weather)
      expect(subject.location).to eq airport
    end

    it 'it does not allow planes to land when weather is bad' do
      allow(weather).to receive(:stormy?).and_return(true) # this means weather is bad

      subject.land_at(airport, weather)
      expect(subject.location).to eq(nil)
    end




end
