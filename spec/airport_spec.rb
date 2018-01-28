require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane }
  let(:weather) { double stormy?: false }

  describe 'initialize' do
    it 'creates a new instance' do
      expect(subject).to be_a Airport
    end
  end

  describe 'setting a capacity and creating a default capacity' do  
    it 'creates a default capacity if none is given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows you to set a capacity' do
      new_airport = Airport.new(weather, 100)
      expect(new_airport.capacity).to eq(100)
    end
  end
  
  describe 'landing' do
    before(:each) do
      subject.land(:plane)
    end

    it 'stores a landed plane' do
      expect(subject.planes).to include :plane
    end

    it 'prevents a plane that has landed from landing again' do
      expect { subject.land(:plane) }.to raise_error("Plane has already landed")
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

    it 'prevents a plane that hasn\'t landed from taking off' do
      expect { subject.take_off(Plane.new) }.to raise_error("The plane is not in this airport")
    end
      
    it 'ensures planes can only take off from airports they have landed in' do
      other_airport = Airport.new
      expect { other_airport.take_off(:plane) }.to raise_error("The plane is not in this airport")
    end
  end
  
  describe 'does not allow landing when at capacity' do  
    it 'does not allow landing when at capacity' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Plane cannot land. Airport is full")
    end
  end

  describe 'behaviour during stormy weather' do
    it 'does not allow a plane to land in stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.land(:plane) }.to raise_error("Stormy weather - can't land")
    end

    it 'does not allow a plane to take off in stormy weather' do
      subject.land(:plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(:plane) }.to raise_error("Stormy weather - can't take off")
    end
  end
end    
