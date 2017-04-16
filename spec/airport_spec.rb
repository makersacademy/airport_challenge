require 'airport'

describe Airport do

  # let(:plane) { Plane.new }
  let(:plane) { double :plane }

  before do
    allow(Weather).to receive(:stormy?).and_return false
  end

  it 'will not let plane land when stormy' do
    allow(Weather).to receive(:stormy?).and_return(true)
    message = 'Too stormy to land!'
    expect { subject.land(plane) }.to raise_error message
  end

  it 'will not allow plane to take off when stormy' do
    subject.land(plane)
    allow(Weather).to receive(:stormy?).and_return(true)
    message = 'Too stormy to take off!'
    expect { subject.take_off(plane) }.to raise_error message
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'instructs a plane to land' do
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
  end

  it 'has landed plane' do
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'prevents landing when airport is full' do
    message = 'Landing denied, airport is full!'
    described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error message
  end

  it 'sets default capacity' do
    message = 'Landing denied, airport is full!'
    100.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error message
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#take_off' do
    it 'instructs a plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end
  end

  it 'no longer has plane after takeoff' do
    subject.land(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error 'Plane has left the airport!'
  end

end
