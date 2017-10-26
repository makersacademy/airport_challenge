require 'airport'
require 'plane'

describe Airport do
  describe '#land(plane)' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'raises error when stormy' do
      allow(subject).to receive(:stormy?) {true}
      expect {subject.land(Plane.new)}.to raise_error "Too stormy to land!"
    end
    it 'raises error when airport is full' do
      allow(subject).to receive(:stormy?) {false}
      expect {21.times{subject.land(Plane.new)}}.to raise_error "Airport is currently full!"
    end
  end

  describe '#takeoff' do
    it 'plane takes off and receive confirmation' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) {false}
      subject.land(plane)
      expect(subject.takeoff).to eq("#{plane} has taken off.")
    end

    it 'it raises error when stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) {false}
      subject.land(plane)
      allow(subject).to receive(:stormy?) {true}
      expect{subject.takeoff}.to raise_error "Too stormy to takeoff!"
    end
  end
end
