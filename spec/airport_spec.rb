require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double :plane}
  let(:plane2) {double :plane}

  describe 'Landing Planes' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:status)
    end

    it 'responds to the method land' do
      expect(airport).to respond_to(:instruct_landing).with(1).argument
    end

    it 'stores a plane in the airport when landing' do
      expect(airport.instruct_landing(plane).last).to eq(plane)
    end

    it 'plane has landed and confirms landing' do
      plane34 = Plane.new
      airport.instruct_landing(plane34)
      expect(plane34.status).to eq("The plane has landed")
    end

    context 'edge case' do
        it 'raises error if plane has already landed' do
          plane72 = Plane.new
          airport.instruct_landing(plane72)
          expect {plane72.land}.to raise_error("The plane has already landed")
        end
      end

    context 'full capacity' do
        it 'raises an error when there is no space in the airport for a plane to land' do
          Airport::DEFAULT_CAPACITY.times { airport.instruct_landing(plane) }
          expect {subject.instruct_landing(plane)}.to raise_error("There is no space in the airport")
        end
      end

    context 'stormy weather' do
        it 'raises an error when trying to land if weather is stormy' do
          allow(airport).to receive(:stormy?) {true}
          expect {airport.instruct_landing(plane)}.to raise_error("The weather is too stormy to land")
        end
      end
  end

  describe 'Planes Taking Off' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:taken_off)
      allow(plane).to receive(:status)
    end

    it 'responds to the method take-off' do
      expect(airport).to respond_to(:instruct_take_off).with(1).argument
    end

    it 'returns plane when taking off' do
      airport.instruct_landing(plane)
      expect(airport.instruct_take_off(plane)).to eq(plane)
    end

    it 'plane takes off and confirms it is no longer in the airport' do
      plane56 = Plane.new
      subject.instruct_landing(plane56)
      subject.instruct_take_off(plane56)
      expect(plane56.status).to eq("The plane has taken off")
    end

    context 'edge case' do
        it 'raises error if plane has already taken-off (if there is more than one plane in the airport to begin with)' do
          2.times { airport.instruct_landing(plane) }
          plane32 = Plane.new
          airport.instruct_landing(plane32)
          airport.instruct_take_off(plane32)
          expect {subject.instruct_take_off(plane32)}.to raise_error("The plane has already taken off")
        end
      end

    context 'empty airport' do
      it 'raises an error when there are no planes to take off from the airport' do
        expect {airport.instruct_take_off(plane)}.to raise_error("There are no planes in the airport")
      end
    end

    context 'won\'t take off when stormy'  do
      it 'raises error The weather is too stormy to take off' do
        plane38 = Plane.new
        airport.instruct_landing(plane38)
        allow(airport).to receive(:stormy?) {true}
        expect {airport.instruct_take_off(plane38)}.to raise_error("The weather is too stormy to take off")
      end
    end

  end

  describe 'Setting Capacity' do
    it 'the airport has a default capacity of 3 planes' do
      airport = Airport.new
      expect(airport.capacity).to eq(3)
    end

    it 'the airport can have a capacity of 20 planes' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end

  end

end
