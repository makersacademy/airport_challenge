require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'saves the landed plane as instance variable & returns it' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'respond to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'takes a plane off from the airport and confirms it has left' do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:stormy?).and_return(false)
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

end
