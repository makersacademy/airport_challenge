require 'airport'
require 'plane'
describe Airport do
    it 'can land a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      expect(subject.land(plane)).to eq subject.planes
    end

    it 'can take off a plane' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to be_an_instance_of(Plane)
    end

    it 'prevents landing when airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect {subject.land(Plane.new)}.to raise_error("Plane capacity is full")
    end

    it 'allows for the default capacity to be overridden' do
      airport = described_class.new(10)
      expect(airport.capacity).to eq 10
    end

    it 'prevents take_off if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.take_off}.to raise_error("Cannot take off while weather is stormy")
    end
    
    it 'prevents landing if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      plane = Plane.new
      expect {subject.land(plane)}.to raise_error("Cannot land while weather is stormy")
    end

    it 'prevents take off if no planes' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.take_off}.to raise_error("There are no planes")
    end

    it 'can be stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq true
    end
    
    it 'can be clear' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.stormy?).to eq false
    end

end