require 'plane'

describe Plane do
  let(:airport) {double(:airport, kind_of?:(Airport))}

  describe 'initialize' do
    it 'is created in the air' do
      plane = Plane.new
      expect(subject.in_air?).to eq true
    end
  end

  context 'landing' do
    it 'will only land if it is in the air' do
      msg = 'Plane already landed'
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm('landed',airport)
      expect{subject.to_land(airport)}.to raise_error msg
    end

    it 'confirm it has landed' do
      allow(airport).to receive(:contains?).and_return(false)
      subject.to_land(airport)
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm('landed',airport)
      expect(subject).not_to be_in_air
    end
  end

  context 'take-off' do
    it 'confirm it is in the air' do
      allow(airport).to receive(:contains?).and_return(true)
      subject.confirm('landed',airport)
      subject.take_off(airport)
      allow(airport).to receive(:contains?).and_return(false)
      subject.confirm('took-off',airport)
      expect(subject).to be_in_air
    end

    it 'will only take-off if it is on the ground' do
      msg = 'Plane already in the air'
      allow(airport).to receive(:contains?).and_return(false)
      subject.confirm('took-off',airport)
      expect{subject.take_off(airport)}.to raise_error msg
    end
  end
end
