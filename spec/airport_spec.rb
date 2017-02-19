require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double :plane }

  before do
    allow(subject).to receive(:stormy?).and_return false
  end

  it 'is able to set capacity of airport' do
    full_error = 'Cannot land, airport full'
    subject.set_capacity(100)
    100.times { subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error full_error
  end


  describe '#land' do
    it 'lands a plane when instructed' do
      expect(subject.land(plane)).to eq plane
    end

    it 'doesn\'t land a plane when airport is full (when default capacity is reached)' do
      full_error = 'Cannot land, airport full'
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error full_error
    end

    it 'doesn\'t land a plane when weather too stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      land_error = 'Cannot land, too stormy'
      expect{ subject.land(plane) }.to raise_error land_error
    end
  end


  describe '#take_off' do
    it 'takes off a plane when instructed' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'doesn\'t allow take off when weather too stormy' do
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      takeoff_error = 'Cannot take off, too stormy'
      expect{ subject.take_off }.to raise_error takeoff_error
    end
  end

end
