require 'airport'
require 'weather'

describe Airport do

let(:plane) { double :plane }


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

    # it 'doesn\'t land a plane when weather too stormy' do
    #   stormy_error = 'Cannot land, too stormy'
    #   allow(subject).to receive(:stormy?).and_return(true)
    #   expect{ subject.land(plane) }.to raise_error stormy_error
    # end

  end

  describe '#take_off' do
    it 'takes off a plane when instructed' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

end
