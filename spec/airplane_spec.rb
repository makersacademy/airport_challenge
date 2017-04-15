require 'airplane'
require 'airport'

describe Airport do

  describe '#land' do
    it 'should land airplane at airport' do
      plane = Airplane.new
      subject.take_off
      subject.land(plane)
      expect(subject.planes.include? plane).to eq true
    end
  end

  describe '#landed?' do
    it 'should confirm airplane landed' do
      expect(Airplane.new.landed?).to eq true
    end
  end

  describe '#take_off' do
    it { should respond_to(:take_off) }

    it 'should make airplane leave airport' do
      plane = Airplane.new
      subject.land(plane)
      subject.take_off
      expect(subject.planes.include? plane).to_not eq true
    end
  end

end
