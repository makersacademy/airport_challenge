require 'airport'

describe Airport do

  describe '#land' do
    it 'should respond to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe 'planes' do
    it 'should return the planes at the airport' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end
end
