require 'airport'

describe Airport do

  describe '#land' do
    it 'should respond to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe '#planes' do
    it 'should return the planes at the airport' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'should have a plane take off' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'confirms that plane has taken off' do
      plane = double(:plane)
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to eq []
    end

  end
end
