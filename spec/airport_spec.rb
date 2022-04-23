describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { instance_double('Plane') }

  describe '#initialize' do
    subject { Airport }
    it { should respond_to(:new) }
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
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error('airport full')
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
