describe Airport do
  subject(:airport) { Airport.new }

  describe '#initialize' do
    subject { Airport }
    it { should respond_to(:new) }
  end

  describe '#land' do
    it { should respond_to(:land) }

    it { should respond_to(:land).with(1) }

    it 'land plane' do
      plane = instance_double('Plane')
      expect(airport.land(plane)).to include(plane)
    end
  end
end