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

    it 'stores the information that the plane has landed' do
      subject.stormy = false
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'only lands if the airport is empty' do
      plane1 = Plane.new
      subject.land(plane1)
      plane2 = Plane.new
      expect { subject.land(plane2) }.to raise_error("The plane can't land - the airport is full")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'the plane can take off when the weather is sunny' do
      subject.stormy = false
      plane = Plane.new
      expect { subject.take_off(plane) }.not_to raise_error
    end

    it "the plane can't be landed when the weather is stormy" do
      subject.stormy = true
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error("The plane can't take off - it is stormy")
    end
  end

  describe 'weather conditions' do
    it 'the weather can be changed to stormy' do
      subject.stormy = true
      expect(subject.stormy?).to eq true
    end
  end

  describe 'Capacity' do
    it 'has a default capacity of 100' do
      expect(Airport::DEFAULT_CAPACITY).to eq 100
    end
  end
end
