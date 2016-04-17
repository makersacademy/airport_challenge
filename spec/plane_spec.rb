require 'plane'

describe Plane do
  subject(:plane) { described_class.new}

  describe 'initialise' do
    it 'initialises with flying planes' do
      expect(subject.flying?).to eq true
    end
  end

  describe 'landing plane' do

    it 'lands the plane' do
      allow(subject).to receive(:land)
      allow(subject).to receive(:flying?)
      expect(subject.land).not_to eq(:flying?)
  end

    it 'prevents landing if plane is not flying' do
      allow(subject).to receive(:flying?) {false}
      expect{subject.land}.to raise_error 'Plane not flying'
    end
  end

  describe 'taking off plane' do

     it 'takes plane off' do
       allow(subject).to receive(:take_off)
       allow(subject).to receive(:land)
       allow(subject).to receive(:flying?)
       subject.land
       expect(subject.take_off).to eq subject.flying?
     end

     it 'prevents take off if plane is already flying' do
      allow(subject).to receive(:flying?) {true}
      expect{subject.take_off}.to raise_error 'Plane already flying'
    end
  end
end

