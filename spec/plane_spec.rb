require './lib/plane'

describe Plane do
  let(:airport) { double :airport }

  context '#land' do
    it 'should respond to land' do
      expect(subject).to respond_to :land
    end

    it 'should throw error if trying to land when already landed' do
      subject.landed = true
      expect { subject.land }.to raise_error('Plane already landed')
    end
  end

  context '#take_off' do
    it 'should respond to take off' do
      expect(subject).to respond_to :take_off
    end
  end
end
