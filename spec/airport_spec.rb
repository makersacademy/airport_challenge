require 'airport'
require 'airplane'
require 'weather'

describe Airport do

  describe '#land' do
    it 'should land airplane at airport' do
      plane = Airplane.new
      subject.take_off
      subject.land(plane)
      expect(subject.runways.include? plane).to eq true
    end
  end

  describe '#landed?' do
    it 'should confirm airplane landed' do
      plane = Airplane.new
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end

    it 'should tell when airplane is not on land' do
      plane = Airplane.new
      subject.land(plane)
      subject.take_off
      expect(subject.landed?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it { should respond_to(:take_off) }

    it 'should make airplane leave airport' do
      plane = Airplane.new
      subject.land(plane)
      subject.take_off
      expect(subject.runways.include? plane).to_not eq true
    end
  end

end
