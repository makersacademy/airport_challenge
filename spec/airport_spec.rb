require 'airport'
require 'plane'
describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'the plane can be landed when the weather is sunny' do
      subject.stormy = false
      expect { subject.land(double(:plane)) }.not_to raise_error
    end

    it "the plane can't be landed when the weather is stormy" do
      subject.stormy = true
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error("The plane can't be landed - it is stormy")
    end

    it 'only lands if the airport is not full' do
      100.times { subject.land(Plane.new) }
      expect { subject.land(Plane) }.to raise_error("The plane can't land - the airport is full")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'the plane can take off when the weather is sunny' do
      plane = Plane.new
      subject.land(plane)
      subject.stormy = false
      expect { subject.take_off(plane) }.not_to raise_error
    end

    it "the plane can't be landed when the weather is stormy" do
      subject.stormy = true
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error("The plane can't take off - it is stormy")
    end

    it 'the plane leaves the airport' do
      plane = Plane.new
      subject.land(plane)
      before = subject.planes.length
      subject.take_off(plane)
      after = subject.planes.length
      expect(before - after).to eq 1
    end

    it 'only can take off if it is in the arport' do
      plane = Plane.new
      subject.land(plane)
      rogue_plane = "I'm not in the airport!"
      expect{ subject.take_off(rogue_plane) }.to raise_error("This plane is not at the airport!")
    end
  end

  describe 'weather conditions' do
    it 'the weather can be changed to stormy' do
      subject.stormy = true
      expect(subject.stormy?).to eq true
    end
  end

  describe 'capacity' do
    it 'has a default capacity of 100' do
      expect(Airport::DEFAULT_CAPACITY).to eq 100
    end

    it 'has a method for capacity' do
      expect(subject).to respond_to(:capacity)
    end

    it 'the capacity can be updated' do
      subject.capacity = 300
      expect(subject.capacity).to eq 300
    end
  end
end
