describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { instance_double('Plane') }

  describe '#initialize' do
    subject { Airport }
    it { should respond_to(:new) }

    it { should respond_to(:new).with(1) }
  end

  describe '#capacity' do
    it { should respond_to(:capacity) }

    it 'it is expected to have a default value' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    context 'when capacity is manually set' do
      it 'default value is expected to be changed' do
        different_airport = Airport.new(3)
        expect(different_airport.capacity).to_not eq Airport::DEFAULT_CAPACITY
      end
    end
  end

  describe '#land' do
    it { should respond_to(:land) }

    it { should respond_to(:land).with(1) }

    context 'when it is not full' do
      it 'is expected to land the plane' do
        expect(airport.land(plane)).to include(plane)
      end
    end

    context 'when it is full' do
      it 'is expected to not land the plane' do
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error('Airport full')
      end
    end
  end

  describe '#take_off' do
    it { should respond_to(:take_off) }

    it { should respond_to(:take_off).with(1) }

    context 'when there is a plane' do
      it 'is expected to take off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq(plane)
      end
    end

    context "when it doesn't contain the plane" do
      it 'is expect to not take off' do
        expect { airport.take_off(plane) }.to raise_error('Plane not at airport')
      end
    end
  end

  describe '#planes' do
    it { should respond_to(:planes) }
    
    context 'when a plane has taken off' do
      it 'is expected to not contain the plane' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include(plane)
      end
    end
  end
end
