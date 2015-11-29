require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#land' do
    before do
      subject.land airport
    end

    it 'is not flying after landing' do
      expect(subject.flying).to eq false
    end

    it 'raises error if plane not flying' do
      expect{subject.land airport}.to raise_error 'Plane already landed!'
    end
  end

  describe '#take_off' do
    it 'is flying after take off' do 
      subject.land airport
      subject.take_off
      expect(subject.flying).to eq true
    end

    it 'raises error if plane already flying' do
      expect{subject.take_off}.to raise_error 'Plane already flying!'
    end
  end

  describe '#airport' do
    it 'reports the airport it landed in' do
      subject.land airport
      expect(subject.airport).to eq airport
    end

    it 'raises error if plane flying' do
      expect{subject.airport}.to raise_error 'Plane is currently flying!'
    end
  end
end
