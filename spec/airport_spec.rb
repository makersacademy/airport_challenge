require 'airport'

describe Airport do

  describe '#accept' do

    let(:plane) { double :plane, land: true, landed?: true }
    it 'accepts an plane' do
      subject.accept(plane)
      expect(subject.planes).to eq [plane]
      expect(plane).to be_landed
    end

  end

  describe '#take_off' do

    let(:plane) { double :plane, land: true, landed?: false, take_off: nil}
    it 'takes off a plane' do
      subject.accept(plane)
      subject.take_off(plane)
      expect(plane).to_not be_landed
      expect(subject.planes).to eq []
    end

  end

end
