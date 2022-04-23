describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { instance_double('Plane') }

  describe '#capacity' do
    it 'should have a default value' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    context 'when capacity is manually set' do
      it 'should change the capacity' do
        different_airport = Airport.new(3)
        expect(different_airport.capacity).to_not eq Airport::DEFAULT_CAPACITY
      end
    end
  end

  describe '#land' do
    context 'when it is not full' do
      it 'should instruct the plane to land' do
        expect(airport.land(plane)).to include(plane)
      end
    end

    context 'when it is full' do
      it 'should not instruct the pland to land' do
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error('Airport full')
      end
    end
  end

  describe '#take_off' do
    context 'when there is a plane' do
      it 'should instruct the plane to take off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq(plane)
      end
    end

    context "when it doesn't contain a plane" do
      it 'should not instruct the plane to take off' do
        expect { airport.take_off(plane) }.to raise_error('Plane not at airport')
      end
    end
  end

  describe '#planes' do
    context 'when a plane has taken off' do
      it 'should no longer contain the plane' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include(plane)
      end
    end
  end
end
