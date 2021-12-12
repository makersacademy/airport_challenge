require 'airport'
require 'plane'
# Describe Airport class land method
context Airport do
  # subject = Airport
  # land method
  let(:plane) { Plane.new } # everytime when we call plane a new plane will be created.
  describe '#land' do
    it 'should land a plane' do
      allow(subject).to receive(:stormy?) { "Sunny" }
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it 'should not land any plane when airport is full' do
      allow(subject).to receive(:stormy?) { "Sunny" }
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport is currently full. There is not any space for landing...')
    end
    it 'airport should have a default capacity which can be updated' do
      airport = Airport.new(10)
      allow(airport).to receive(:stormy?) { "Sunny" }
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error('Airport is currently full. There is not any space for landing...')
    end
    it 'should not let landing when weather is stormy' do
      # allow method needs to be used
      allow(subject).to receive(:stormy?) { 'Stormy' }
      expect { subject.land(plane) }.to raise_error("The weather conditions do not allow for safe landing...")
    end
  end
  # take_off method
  describe '#take_off' do
    it 'should take of a plane' do
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
end
