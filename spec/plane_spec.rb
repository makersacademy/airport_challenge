require './lib/plane'


describe Plane do
  let(:airport) { double :airport }

  context '#land' do
    it 'should respond to land' do
      expect(subject).to respond_to :land
    end

    it 'should change landed to true' do
      subject.landed = false
      subject.land
      expect(subject.landed).to eq true
    end

    it 'should throw error if already landed' do
      subject.landed = true
      expect { subject.land }.to raise_error('Plane already landed')
    end
  end

  context '#take_off' do
    it 'should respond to take off' do
      expect(subject).to respond_to :take_off
    end

    it 'should change landed to false' do
      subject.landed = true
      subject.take_off
      expect(subject.landed).to eq false
    end

    it 'should throw error if already taken off' do
      subject.landed = false
      expect { subject.take_off }.to raise_error('Plane already taken off')
    end
  end
end
