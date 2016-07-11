require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:subject) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) {double :weather}
  it 'prevents landing if weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect{subject.take_off plane}.to raise_error 'Weather condition is bad, no take offs'
  end
  
  it {is_expected.to respond_to :land}
  it {is_expected.to respond_to(:land).with(1).argument }
  it 'instructs a plane to land and airport confirms landing' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    expect(subject.land(plane)).to eq "The plane #{plane} has landed"
  end


  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to(:take_off).with(1).argument}

  it 'instructs a plane to take off and confirms it' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.land plane
    expect(subject.take_off(plane)).to eq "The plane #{plane} has taken off"
  end

  it 'when a plane took off from airport it confirms that plane is no longer in airport' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.take_off plane
    expect(subject.planes.map{|x| x if x == plane}.empty?).to be true
  end

  it 'prevents take off if weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.land plane
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect{subject.take_off(plane)}.to raise_error('Weather condition is bad, no take offs')
  end

  it 'prevents landing if weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect{subject.land(plane)}.to raise_error('Weather condition is bad, no landing')
  end
  it 'prevents landing if airport is full' do
    expect(subject.planes.size).to be <= Airport::DEFAULT_CAPACITY
  end

  it 'default airport capacity could be overridden as appropriate' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end

end
