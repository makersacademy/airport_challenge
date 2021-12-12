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
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error('Airport is currently full. There is not any space for landing...')
    end
    it 'airport should have a default capacity which can be updated' do
      airport = Airport.new(10)
      allow(airport).to receive(:stormy?) { "Sunny" }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error('Airport is currently full. There is not any space for landing...')
    end
    it 'should not land any plane which is already landed' do
      allow(subject).to receive(:stormy?) {'Sunny'}
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error('Plane is already in the airport')
    end
    it 'should not let landing when weather is stormy' do
      # allow method needs to be used
      allow(subject).to receive(:stormy?) { 'Stormy' }
      expect { subject.land(plane) }.to raise_error("The weather conditions do not allow for safe landing...")
    end
  
  end
  # take_off method
  describe '#take_off' do
    it 'should take off a plane' do
      allow(subject).to receive(:stormy?) { "Sunny" }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
    it 'should not let take off when weather is stormy' do
      allow(subject).to receive(:stormy?) { 'Stormy' }
      expect { subject.take_off(plane) }.to raise_error('The weather conditions do not allow for safe take-off...')
    end
    it 'should not take off a plane which is not in the airport' do
      allow(subject).to receive(:stormy?) { 'Sunny' }
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane)}.to raise_error('This plane is not in the airport')
    end
  end
  # test stormy?
  context '#stormy?' do
    it 'should return "Sunny" or "Stormy"' do
      expect(subject.stormy?).to eq('Stormy').or eq('Sunny')
    end
  end
end
