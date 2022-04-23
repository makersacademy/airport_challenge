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

    it 'should land' do
      expect(airport.land(plane)).to include(plane)
    end
  end

  describe '#take_off' do
    it { should respond_to(:take_off) }

    it { should respond_to(:take_off).with(1) }

    context 'when there is a plane' do
      it 'should take off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq(plane)
      end
    end
  end
end
