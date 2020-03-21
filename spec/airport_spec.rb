require 'airport'

describe '#land(plane)' do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'Airport can #land(plane)' do

    it 'Airport responds to land(plane)' do
      expect(airport).to respond_to(:land)
    end

    it 'Plane lands in airport' do
      expect(airport.land.to be_instance_of(Plane)
    end

  end
end

