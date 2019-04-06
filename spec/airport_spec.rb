require 'airport'
require 'plane'

describe Airport do

  it 'should respond to #land' do
    expect(subject).to respond_to :land
  end

  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'should allow a plane to take_off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes in airport' do
      expect(subject.take_off).to raise_error 'no planes available'
    end
  end
end
