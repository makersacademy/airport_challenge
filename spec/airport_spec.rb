require 'airport'
require 'plane'
describe Airport do
    it 'can land a plane' do
        plane = Plane.new
        expect(subject.land(plane)).to eq subject.planes
    end

    it 'can take off a plane' do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.take_off).to be_an_instance_of(Plane)
    end

    it 'prevents landing when airport is full' do
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect {subject.land(Plane.new)}.to raise_error("Plane capacity is full")
    end

    it 'allows for the default capacity to be overridden' do
      allow(subject).to receive(:stormy?).and_return(false)
      airport = described_class.new(10)
      10.times {airport.land(Plane.new)}
      expect {airport.land(Plane.new)}.to raise_error("Plane capacity is full")
    end

    it 'prevents take_off if weather is stormy' do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.take_off}.to raise_error("Cannot take off while weather is stormy")
    end
    
    it 'prevents landing if weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.land(plane)}.to raise_error("Cannot land while weather is stormy")
    end

    it 'prevents take off if no planes' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect {subject.take_off}.to raise_error("There are no planes")
    end
end