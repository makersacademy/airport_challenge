require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:largeairport) { described_class.new(15) }

  before do
    allow(plane).to receive(:land)
  end

  context 'can do simple landings (Story 01) as:' do
    it 'it instructs a plane to land' do
      expect(plane).to receive(:land)
      # line above yields 'expected: 1 time, received: 0 times' in Rspec if there's no plane.land below
      subject.land plane
      plane.land
    end

    it 'holds the actual plane after landing' do
      airport.land(plane)
      expect(subject.planes).to include plane
    end
  end

  before do
    allow(plane).to receive(:takeoff)
  end

  context 'can do simple takeoffs (Story 02) as:' do
    it 'it instructs a plane to take off' do
      expect(plane).to receive(:takeoff)
      subject.takeoff plane
      plane.takeoff
    end

    it 'confirms Elvis... err, the plane has left the building... err, the airport' do
      airport.takeoff(plane)
      expect(subject.planes).not_to include plane
    end
  end

  context 'prevents traffic when weather is stormy:' do
    it 'by politely refusing takeoffs (Story 03)' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error 'Sorry, no takeoffs during stormy weather!'
    end

    it 'by politely refusing landings (Story 04)' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Sorry, no landings during stormy weather!'
    end
  end

  context 'prevents landings when airport is full (Story 05):' do
    it 'by politely refusing to land a new plane' do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Airport is full, please head to LCY.'
    end
  end

  context 'uses software that can set plane capacity (Story 06):' do
    it 'to a default value' do
      expect(subject.instance_variable_get(:@capacity)).to eq 3
    end

    it 'set to a constant' do
      expect(Airport).to be_const_defined(:CAPACITY)
    end

    it 'that can be overriden as appropriate' do
      expect(largeairport.instance_variable_get(:@capacity)).to eq 15
    end

  end

end
