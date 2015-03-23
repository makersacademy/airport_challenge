require 'airport'

describe Airport do

  context 'taking off and landing' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it { is_expected.to respond_to :planes }

    it 'should change status of plane to landed when it lands' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land plane
      expect(plane.status).to eq 'landed'
    end

    it { is_expected.to respond_to :take_off }

    it 'should status of plane to flying after take_off' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land plane
      subject.take_off
      expect(plane.status).to eq 'flying'
    end

    it 'cannot land plane if the airport is full' do
      allow(subject).to receive(:weather) { 'sunny' }
      20.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport Full'
    end

    it 'should have a capacity' do
      expect(subject).to respond_to :capacity
    end

    it 'cannot take off plane of empty' do
      allow(subject).to receive(:weather) { 'sunny' }
      expect { subject.take_off }.to raise_error 'Airport Empty'
    end

  end

  context 'weather conditions' do

    it { is_expected.to respond_to :weather }

  end
end
