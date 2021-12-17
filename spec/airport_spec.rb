require 'airport'

RSpec.describe Airport do
  describe '#call_to_land' do
    it 'requests a flying plane to land on the airport' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      expect(subject.call_to_land(plane)).to eq "#{plane} landed!"
    end
    it 'throws an error when airport is full' do
      allow(subject).to receive(:stormy?) {false}
      subject.capacity.times { subject.call_to_land(Plane.new) }
      expect { subject.call_to_land(Plane.new) }.to raise_error('No free docks!')
    end
    it 'throws an error when stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      expect { subject.call_to_land(Plane.new) }.to raise_error('Too stormy at airport!')
    end
  end
  
  describe '#call_to_take_off' do
    it 'requests a landed plane to take off' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      subject.call_to_land(plane)
      expect(subject.call_to_take_off(plane)).to eq "#{plane} has taken off!"
    end
    it 'throws an error when asking a plane to take off that is not in airport' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      plane.land()  # land the plane whereever, but not at this airport
      expect { subject.call_to_take_off(plane) }.to raise_error("#{plane} is not at this airport!")
    end
    it 'throws an error when stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      expect { subject.call_to_take_off(Plane.new) }.to raise_error('Too stormy at airport!')
    end
  end 
end
