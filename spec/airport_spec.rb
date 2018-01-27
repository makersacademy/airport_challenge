require 'airport'
require 'weather'

plane = Plane.new

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe 'initialize' do
    it 'creates a new instance' do
      expect(subject).to be_a Airport
    end

  describe 'setting a capacity and creating a default capacity' do  
    it 'creates a default capacity if none is given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows you to set a capacity' do
      new_airport = Airport.new(100)
      expect(new_airport.capacity).to eq(100)
    end
  end
end

  describe 'landing' do
    before(:each) do
      subject.land(:plane)
    end

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane and stores the fact that the plane has landed' do
      expect(subject.planes).to include :plane
    end
  end

 describe 'taking off' do
    before(:each) do
      subject.land(:plane)
    end

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'takes off a plane' do
      subject.take_off(:plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'confirms that a plane has left the airport once taken off' do
      expect(subject.take_off(:plane)).to eq("The plane has taken off and left the airport")
    end
  end
  
  describe 'airport capacity is reached' do
    it 'raises an error when full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Plane cannot land. Airport is full"
    end
  end

  describe 'airport is empty' do
    it 'raises an error if a plane tries to take off from an empty airport' do
      expect { subject.take_off(:plane) }.to raise_error("The airport is empty")
    end
  end

end  
    # it 'prevents a plane from taking off if stormy' do
    #   allow(weather).to receive(:stormy?).and_return(true)
    #   subject.take_off(:plane)
    #   it { is_expected.to raise_error "Plane cannot take off in stormy weather"}
      # expect(subject.take_off(:plane)).to raise_error "Plane cannot take off in stormy weather"

  # other tests

  # planes can only take off from airports they are in and airports they've landed in
  # planes that are already flying cannot take off or be in an airport
  # planes that are landed cannot land again and must be in an airport
  # if there are multiple planes in the airport, the correct plane takes off'