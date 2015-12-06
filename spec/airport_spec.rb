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
    context 'when the weather is not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
        allow(airport).to receive(:full?).and_return false
      end

      it 'should check that the plane is in the airport' do
        plane = double(:plane, land: true, in_airport_status: true)
        airport.instruct_to_land(plane)
        expect(plane.in_airport_status).to eq true
      end

      it "should change the plane's status to 'in airport'" do
        plane = double(:plane, in_airport_status: true, land: true)
        plane.land
        expect(plane.in_airport_status).to eq true
      end

      context 'when the airport is full' do
        it "should raise an error" do
          plane = double(:plane, in_airport_status: true, land: true)
          allow(airport).to receive(:landed?).and_return true
          message = "The plane is already in the airport"
          expect{ airport.instruct_to_land(plane) }.to raise_error message
        end
      end
    end

    context 'when the weather is stormy' do
      it 'should raise an error if the weather is stormy' do
        plane = double(:plane, in_airport_status: false, land: false)
        allow(airport).to receive(:stormy?).and_return true
        message = "No planes can land as it is stormy"
        expect{ airport.instruct_to_land(plane) }.to raise_error message
      end
    end

  end

  describe '#instruct_take_off' do
    before do
      allow(airport).to receive(:full?).and_return false
    end

    context 'when the weather is not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'should let a plane take off' do
        plane = double(:plane, in_airport_status: false, take_off: true, land: true)
        airport.instruct_to_land(plane)
        airport.instruct_take_off(plane)
        expect(plane.take_off).to eq true
      end

      it 'should raise an error if no planes are available to take off' do
        plane = double(:plane, in_airport_status: true)
        landed_planes = []
        message = "There are no planes in the airport"
        expect { airport.instruct_take_off(plane) }.to raise_error message
      end

      it "should change the plane's status to not in airport" do
        plane = double(:plane, in_airport?: false)
        expect(plane.in_airport?).to eq false
      end
    end

    context 'when the weather is stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it 'should raise an error' do
        plane = double(:plane, in_airport?: false, land: true, take_off: false)
        message = "No planes can take off as it is stormy"
        expect { airport.instruct_take_off(plane) }.to raise_error message
      end
    end

  end

  describe '#full?' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'should raise an error if airport is full' do
      plane = double(:plane, in_airport_status: false, land: true)
      Airport::DEFAULT_CAPACITY.times do
        airport.instruct_to_land(plane)
      end
      message = "The airport is full, so no more planes can land"
      expect { airport.instruct_to_land(plane) }.to raise_error message
    end
  end

end
