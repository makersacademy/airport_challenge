require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }

  describe '#land' do

    before(:each) do
      allow(plane).to receive(:ground)
      allow(plane).to receive(:in_flight).and_return true
      allow(airport).to receive(:bad_weather?).and_return false
    end

    it 'lands plane' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'prevents landing when weather is stormy' do
      allow(airport).to receive(:bad_weather?).and_return true
      expect{airport.land(plane)}.to raise_error "Ach no, there's a storm a-brewin'!"
    end

    it 'prevents landing when airport is full' do
      Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error "Sorry, we've got more planes than you can shake a stick at."
    end

    it 'prevents landing if plane is grounded' do
      allow(plane).to receive(:in_flight).and_return false
      expect{airport.land(plane)}.to raise_error "Plane's aleady down, Sir."
    end

  end

  describe '#take_off' do

    before (:each) do
      allow(airport).to receive(:bad_weather?).and_return false
    end

    it 'allows planes to take off and leave airport' do
      plane = double(:plane, :ground => false, :fly => true)
      allow(plane).to receive(:in_flight)
      plane2 = double(:plane2, :ground => false)
      allow(plane2).to receive(:in_flight)
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      expect(airport.planes).to eq [plane2]
    end

    it 'it prevents take off when weather is stormy' do
      plane = double(:plane, :ground => false, :fly => true)
      allow(plane).to receive(:in_flight)
      airport.land(plane)
      allow(airport).to receive(:bad_weather?).and_return true
      expect{airport.take_off(plane)}.to raise_error "Ach no, there's a storm a-brewin'!"
    end

    it 'prevents take off if plane is flying' do
      allow(plane).to receive(:in_flight).and_return true
      expect{airport.take_off(plane)}.to raise_error "Plane's already up there, Sir."
    end

    it 'only allows plane to take off from airport they are in' do
      plane = double(:plane, :ground => false, :in_flight => true)
      airport2 = Airport.new
      allow(airport2).to receive(:bad_weather?).and_return false
      airport2.land(plane)
      plane = double(:plane, :fly => false, :in_flight => false)
      expect{airport.take_off(plane)}.to raise_error "Plane's in another airport, Sir."
    end

  end

  it 'sets airport capacity' do
    allow(airport).to receive(:bad_weather?).and_return false
    airport = Airport.new(2)
    expect(airport.capacity).to eq 2
  end

end
