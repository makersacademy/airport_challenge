require 'airport'

describe '#land(plane)' do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'Airport can #land planes' do

    it 'Airport responds to #land' do
      expect(airport).to respond_to(:land)
    end

    it 'Plane lands in airport' do
      expect(airport.land).to be_instance_of(Plane)
    end

  end

<<<<<<< HEAD
  context 'Airport can #take_off planes' do

    it 'Airport responds to #take_off' do
      expect(airport).to respond_to(:take_off)
    end

  end

=======
>>>>>>> parent of 332159d... Airport responds to #take_off
end
