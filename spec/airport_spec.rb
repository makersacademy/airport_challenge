require 'airport'

describe Airport do

  describe '#initialize' do
    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq(20)
    end

    it 'has a variable capacity' do
      small_airport = Airport.new(5)
      expect(small_airport.capacity).to eq(5)
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should raise error if Airport is full' do
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error "This airport is full."
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'releases planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

end
