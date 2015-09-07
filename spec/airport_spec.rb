require 'airport'

describe Airport do

  describe 'take off' do

    it 'releases a plane' do
      allow(subject).to receive(:chance) {2}
      plane = Plane.new
      subject.touch_down plane
      subject.depart
      expect(plane.flying?).to be_truthy
    end
  end

  describe '#landing' do

    it 'instructs a plane to touch_down' do
      allow(subject).to receive(:chance) {2}
      plane = Plane.new
      subject.touch_down plane
      expect(plane.landed?).to be_truthy
    end

    it 'receives a plane' do
      allow(subject).to receive(:chance) {2}
      plane = Plane.new
      subject.touch_down Plane.new
      expect(subject).to include(plane)
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:chance) {2}
        subject.capacity.times {subject.touch_down (Plane.new)}
        expect{subject.touch_down (Plane.new)}.to raise_error("Airport is full")
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane = Plane.new
        allow(subject).to receive(:chance) {1}
        allow(plane).to receive(:touch_down)
        expect{plane.depart}.to raise_error("Weather will not permit")
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:chance) {1}
        expect{subject.touch_down Plane.new}.to raise_error("Weather will not permit")
      end
    end
  end
end
