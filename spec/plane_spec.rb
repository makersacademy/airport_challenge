require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double(:airport, is_a?:(Airport))}

  describe 'initialize' do
    it 'is created in the air' do
      plane = Plane.new
      expect(subject.in_air?).to eq true
    end
  end

  context 'landing' do
    it 'cannot land if not instructed by airport' do
      msg = 'Cannot land without being instructed to'
      expect{subject.to_land}.to raise_error msg
    end

    it 'will only land if it is in the air' do
      msg = 'Plane already landed'
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm(:landed,airport)
      expect{subject.to_land(airport)}.to raise_error msg
    end

    it 'confirm it has landed' do
      allow(airport).to receive(:contains?).and_return(false)
      subject.to_land(airport)
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm(:landed,airport)
      expect(subject).not_to be_in_air
    end
  end

  context 'take-off' do
    it 'cannot take-off if not instructed by airport' do
      msg = 'Cannot take-off without being instructed to'
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm(:landed,airport)
      expect{subject.take_off}.to raise_error msg
    end

    it 'confirm it is in the air' do
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm(:landed,airport)
      subject.take_off(airport)
      allow(airport).to receive(:contains?).and_return(false)
      subject.confirm(:took_off,airport)
      expect(subject).to be_in_air
    end

    it 'will only take-off if it is on the ground' do
      msg = 'Plane already in the air'
      allow(airport).to receive(:contains?).and_return(false)
      subject.confirm(:took_off,airport)
      expect{subject.take_off(airport)}.to raise_error msg
    end
  end
end
