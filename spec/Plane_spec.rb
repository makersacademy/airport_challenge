require 'Plane.rb'
require 'Weather.rb'

describe Plane do
  let(:airport) {double :airport}
  let(:weather) {double :weather}


    it 'allows planes to land at a specific Airport' do
      allow(weather).to receive(:stormy?).and_return(false) # this means weather is good

      subject.land_at(airport)
      expect(subject.location).to eq airport
    end

    


end
