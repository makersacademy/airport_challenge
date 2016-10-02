require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) {double :airport}

  describe '#initialize' do
    it 'sets plane status to inflight' do
      expect(subject.send(:status)).to eq :in_flight
    end
  end

  describe '#land' do
    before do
      subject.land
    end
    it 'changes status to landed' do
      expect(subject.send(:status)).to eq :landed
    end
    it 'will not land if already landed' do
      expect{subject.land}.to raise_error "Cannot land: plane is already grounded"
    end
  end

  describe '#take_off' do
    before do
      subject.land
      subject.take_off
    end
    it 'changes status to in flight' do
      expect(subject.send(:status)).to eq :in_flight
    end
    it 'will not take off if already in the air' do
      expect{subject.take_off}.to raise_error "Cannot takeoff: plane is already in the air"
    end
  end
  
  end
