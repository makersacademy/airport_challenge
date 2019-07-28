require 'airport'

describe Airport do
  let(:plane) {double :plane}

  context 'while weather is stormy' do

    it 'Planes cannot take off' do
      plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
      allow(subject).to receive(:weather).and_return(:fine)
      subject.land(plane)
      allow(subject).to receive(:weather).and_return(:stormy)
      message = "no flights while weather is stormy" 
      expect{subject.take_off(plane)}.to raise_error message
    end

    it 'Planes cannot land' do
      plane = double(:plane, change_location: true, landing_check: true)
      allow(subject).to receive(:weather).and_return(:stormy)
      message = message = "no landing while weather is stormy" 
      expect{subject.land(plane)}.to raise_error message
    end
  end

  describe 'Flight collection' do
    before do
      allow(subject).to receive(:weather).and_return("clear")
    end

    it 'is increased by landing' do
      plane = double(:plane, change_location: true, landing_check: true)
      subject.land(plane)
      expect(subject.planes.count).to eq 1
    end

    it 'is depleted by taking off' do
      plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.count).to eq 0
    end
  end

  it 'when setting the capacity of an airport' do
    plane = double(:plane, change_location: true, landing_check: true)
    heathrow = Airport.new(30)
    allow(heathrow).to receive(:weather).and_return("clear")
    30.times{heathrow.land(plane)}
    message = "cannot land while airport is full"
    expect{heathrow.land(plane)}.to raise_error message
  end

  describe 'flight checks raise an error' do
    before do
      allow(subject).to receive(:weather).and_return("clear")
    end

    it 'while taking off an unavailable plane' do
      plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
      subject.land(plane)
      subject.take_off(plane)
      message = "that plane is not in this airport"
      expect{subject.take_off(plane)}.to raise_error message
    end

    it 'while landing in a full airport' do
      plane = double(:plane, change_location: true, landing_check: true)
      10.times{subject.land(plane)}
      message = "cannot land while airport is full"
      expect{subject.land(plane)}.to raise_error message
    end

    it 'while taking off from an empty airport' do
      plane = double(:plane, flight_check: true, change_location: true)
      message = "that plane is not in this airport"
      expect{subject.take_off(plane)}.to raise_error message
    end

    it 'while planes take off from the wrong airport' do
      plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
      heathrow = Airport.new
      allow(heathrow).to receive(:weather).and_return("clear")
      gatwick = Airport.new
      allow(gatwick).to receive(:weather).and_return("clear")
      heathrow.land(plane)
      message = "that plane is not in this airport"
      expect{gatwick.take_off(plane)}.to raise_error message
    end
  end
end