require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  before do
    allow(plane).to receive(:land)
  end

  context 'can do simple landings (Story 01):' do
    it 'it instructs a plane to land' do
      expect(plane).to receive(:land)
      # line above yields 'expected: 1 time, received: 0 times' in Rspec if there's no plane.land below
      subject.land plane
      plane.land
    end

    it 'holds the actual plane after landing' do
      airport.land(plane)
      expect(subject.planes).to eq plane
    end

  end

  before do
    allow(plane).to receive(:takeoff)
  end

  context 'can do simple takeoffs (Story 02):' do
    it 'it instructs a plane to take off' do
      expect(plane).to receive(:takeoff)
      subject.takeoff plane
      plane.takeoff
    end

    it 'confirms Elvis... err, the plane has left the building... err, the airport' do
      airport.takeoff(plane)
      expect(subject.planes).to eq nil
    end

  end

  context 'prevents takeoff when weather is stormy (Story 03)' do
    it 'by returning a polite refusal' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error 'Sorry, no takeoffs during stormy weather!'
    end

  end

end
