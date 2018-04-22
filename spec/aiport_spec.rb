require 'airport'
require 'plane'

describe Airport do
  let(:plane) { spy :plane_double }
  let(:second_plane) { spy :second_plane_double }

  describe '#planes method' do

    it 'should respond to #planes method' do
      expect(subject).to respond_to(:planes)
    end

    it 'should return an array' do
      expect(subject.planes).to be_an_instance_of(Array)
    end
  end

  describe '#capacity method' do

    it 'should respond to #capacity' do
      expect(subject).to respond_to(:capacity)
    end

    it 'should have a default value for capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should allow the system designer to set capacity' do
      expect(described_class.new(20).capacity).to eq 20
    end
  end

  describe '#order_landing method' do

    before(:each) do
      subject.order_landing(plane)
    end

    it 'should order the plane to land' do
      expect(plane).to have_received(:land)
    end

    it 'should pass the airport_id to the plane when it lands' do
      allow(plane).to receive(:airport_id).and_return(subject.__id__)
      expect(plane.airport_id).to eq subject.__id__
    end

    it 'should record that the plane is parked' do
      expect(subject.planes).not_to be_empty
    end

    it 'should raise error for landing when airport is full' do
      expect { subject.order_landing(second_plane) }.to raise_error "Cannot land, airport full"
      expect(second_plane).not_to have_received(:land)
    end

    it 'should raise error for landing when weather is stormy'

    it 'should not issue the #plane.land command when the weather is stormy'
  end

  describe '#order_takeoff method' do

    it 'should respond to #order_takeoff(plane)' do
      expect(subject).to respond_to(:order_takeoff).with(1).arguments
    end

    it 'should prevent landing when the weather is stormy'
  end

  describe '#check_weather method' do

    it 'should respond to #check_weather'
  end

end
