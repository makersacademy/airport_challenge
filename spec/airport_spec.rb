require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'saves the landed plane as instance variable & returns it' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(false)
    expect(subject.land(plane)).to eq "#{plane} has landed at the airport"
  end

  it 'respond to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'takes a plane off from the airport and confirms it has left' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect(subject.take_off).to eq("#{plane} has left the airport")
  end

  it 'returns true to stormy? weather' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect(subject.stormy?).to eq true
  end

  it 'returns false to stormy? weather' do
    allow(subject).to receive(:stormy?).and_return(false)
    expect(subject.stormy?).to eq false
  end

  it 'prevents take off in stormy weather' do
    allow(subject).to receive(:stormy?).and_return(true)
    expect { subject.take_off }.to raise_error "Cannot take off in STORMY weather"
  end

  it 'prevents landing in stormy weather' do
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(true)
    expect { subject.land(plane) }.to raise_error "Cannot land in STORMY weather"
  end

  it 'prevents landing when the airport is full' do
    allow(subject).to receive(:stormy?).and_return(false)
    20.times { subject.land(Plane.new) }
    plane = Plane.new
    expect { subject.land(plane) }.to raise_error "Cannot land when airport is full"
  end

  it 'returns number of planes in the bay' do
    allow(subject).to receive(:stormy?).and_return(false)
    15.times { subject.land(Plane.new) }
    expect(subject.bay_count).to eq "There are 15 planes currently in the bay"
  end

  it 'reduces the bay count when an airplane takes off' do
    allow(subject).to receive(:stormy?).and_return(false)
    15.times { subject.land(Plane.new) }
    subject.take_off
    expect(subject.bay_count).to eq "There are 14 planes currently in the bay"
  end

  it 'increases the bay count when an airplane lands' do
    allow(subject).to receive(:stormy?).and_return(false)
    15.times { subject.land(Plane.new) }
    plane = Plane.new
    subject.land(plane)
    expect(subject.bay_count).to eq "There are 16 planes currently in the bay"
  end

  it 'cannot land a plane that has already landed' do
    allow(subject).to receive(:stormy?).and_return(false)
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error "Plane has already landed"
  end

end

  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(:plane)
      end
      expect{ subject.land(plane) }.to raise_error "Cannot land when airport is full"
    end

  end
