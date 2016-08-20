require 'Plane.rb'

describe Plane do
  let(:airport) {double :airport}
  let(:weather) {double :weather}

  describe '.land_at' do
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


    it 'is possible to confirm if the plane has landed at an airport' do
      allow(weather).to receive(:stormy?).and_return(false) # this means weather is good
      subject.land_at("JFK", weather) #making sure the
      expect(subject.confirm_location).to eq("The plane is currently at JFK.")
    end

    it 'confirms that the plane has landed when it successfully lands' do
      allow(weather).to receive(:stormy?).and_return(false) # this means weather is good
      expect(subject.land_at("JFK", weather)).to eq("The plane is currently at JFK.")
    end
  end

  describe '.take_off' do
    it 'confirms it has taken off when it successfully takes off' do
      allow(weather).to receive(:stormy?).and_return(false) # this means weather is good
      subject.land_at("LHR", weather)
      expect(subject.take_off(weather)).to eq("The plane is currently in the air.")
    end

    it 'does not take off when the weather is bad' do
      allow(weather).to receive(:stormy?).and_return(false) #for this test, to land the plane, it must be good weather first.
      subject.land_at("LGW", weather)
      allow(weather).to receive(:stormy?).and_return(true)
      expect(subject.take_off(weather)).to eq("Can not take off in stormy weather. The plane is currently at LGW.")
    end
  end

end
