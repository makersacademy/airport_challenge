require 'airport'

describe Airport do

  describe '#land' do
    it 'should respond to land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should prevent landing when weather is stormy' do
      plane = double(:plane)
      subject.report_stormy
      expect{subject.land(plane)}.to raise_error 'Sorry, no landing in stormy weather'
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

    it 'prevents take-off when weather is stormy' do
      plane = double(:plane)
      subject.land(plane)
      subject.report_stormy
      # 'Sorry, no taking off when the weather is stormy'
      expect{subject.take_off}.to raise_error 'Sorry, no taking off in stormy weather'
    end

  end
end
