require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  describe '#initialize' do
    it 'should have a default capacity' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'should allow the capacity to be overridden' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end
  end

  describe '#instruct_to_land' do
    it 'should check that the plane is in the airport' do
      plane = double(:plane, land: true, in_airport_status: true)
      allow(airport).to receive(:stormy?).and_return false
      allow(airport).to receive(:full?).and_return false
      airport.instruct_to_land(plane)
      allow(airport).to receive(:landed?).and_return true
      expect(plane.in_airport_status).to eq true
    end

    it "it should change the plane's status to 'in airport'" do
      plane = double(:plane, in_airport?: true, land: true)
      plane.land
      expect(plane.in_airport?).to eq true
    end

    it "it should raise an error if the plane is already in the airport" do
      plane = double(:plane, in_airport_status: true, land: true)
      allow(airport).to receive(:stormy?).and_return false
      allow(airport).to receive(:landed?).and_return true
      message = "The plane is already in the airport"
      expect{ airport.instruct_to_land(plane) }.to raise_error message
    end

    it 'should raise an error if the weather is stormy' do
      plane = double(:plane, in_airport_status: false, land: false)
      allow(airport).to receive(:stormy?).and_return true
      message = "No planes can land as it is stormy"
      expect{ airport.instruct_to_land(plane) }.to raise_error message
    end

  end

  describe '#instruct_take_off' do
    it {is_expected.to respond_to :instruct_take_off}

    it 'should let a plane take off' do
      plane = double(:plane, in_airport_status: false, take_off: true, land: true)
      allow(airport).to receive(:stormy?).and_return false
      allow(airport).to receive(:full?).and_return false
      airport.instruct_to_land(plane)
      airport.instruct_take_off(plane)
      expect(plane.take_off).to eq true
    end

    it 'should raise an error if no planes are available to take off' do
      plane = double(:plane, in_airport_status: true)
      landed_planes = []
      allow(airport).to receive(:stormy?).and_return false
      message = "There are no planes in the airport"
      expect { airport.instruct_take_off(plane) }.to raise_error message
    end

    it 'should raise an error if the weather is stormy' do
      plane = double(:plane, in_airport?: false, land: true, take_off: false)
      allow(airport).to receive(:full?).and_return false
      allow(airport).to receive(:stormy?).and_return true
      message = "No planes can take off as it is stormy"
      expect { airport.instruct_take_off(plane) }.to raise_error message
    end

    it "should change the plane's status to not in airport" do
      plane = double(:plane, in_airport?: false)
      expect(plane.in_airport?).to eq false
    end
  end

  describe '#full?' do
    it 'should raise an error if airport is full' do
      plane = double(:plane, in_airport_status: false, land: true)
      allow(airport).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times do
        airport.instruct_to_land(plane)
      end
      message = "The airport is full, so no more planes can land"
      expect { airport.instruct_to_land(plane) }.to raise_error message
    end
  end
end
