require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:Airport) {described_class.new(weather)}
  let(:plane) {double :plane}
  let(:weather) { Weather.new }

  describe '#initialize' do
    # airport = Airport.new(weather)
    it 'initialize should set a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'landing plane' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane and confirms landing' do
      # airport = Airport.new
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
    #Confirm landing? Check if plane is included in array of planes at airport

    it 'doesn\'t allow landing if the airport is full' do
      # airport = Airport.new
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return false
      subject.capacity.times do
        subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error "Airport Full"
    end

    it 'doesn\'t allow landing if weather is stormy' do
      # airport = Airport
      plane = double("plane", :in_air? => true)
      allow(weather).to receive(:stormy?).and_return true
      expect{ subject.land(plane) }.to raise_error "Cannot land in stormy conditions"
    end
  end

  context 'taking off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'takes off a plane and confirms it is no longer in the airport' do
      # airport = Airport.new
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
    it 'doesn\'t allow landing if weather is stormy' do
      # airport = Airport
      plane = double("plane", :in_air? => false)
      allow(weather).to receive(:stormy?).and_return true
      expect{ subject.take_off(plane) }.to raise_error "Cannot take off in stormy conditions"
    end
    #Confirm landing? Check if plane is included in array of planes at airport

  end
end
