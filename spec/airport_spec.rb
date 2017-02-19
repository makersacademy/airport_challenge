require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double :plane }

  before do
    allow(Weather).to receive(:stormy?).and_return false
  end

  it 'is able to set capacity of airport' do
    full_error = 'Cannot land, airport full'
    subject.set_capacity(100)
    100.times { subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error full_error
  end


  describe '#land' do
    it 'lands a plane when instructed' do
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end

    it 'has the plane after landing' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'doesn\'t land a plane when airport is full (when default capacity is reached)' do
      full_error = 'Cannot land, airport full'
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error full_error
    end

    it 'doesn\'t land a plane when weather too stormy' do
      land_error = 'Cannot land, too stormy'
      allow(Weather).to receive(:stormy?).and_return(true)
      expect{ subject.land(plane) }.to raise_error land_error
    end
  end


  describe '#take_off' do
    it 'takes off a plane when instructed' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'doesn\'t have the plane after takeoff' do
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error 'Plane not at airport'
    end
    
    it 'doesn\'t allow take off when weather too stormy' do
      takeoff_error = 'Cannot take off, too stormy'
      subject.land(plane)
      allow(Weather).to receive(:stormy?).and_return(true)
      expect{ subject.take_off(plane) }.to raise_error takeoff_error
    end
  end

end
