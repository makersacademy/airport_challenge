require 'airport'
require 'plane'

describe Airport do

subject(:airport) {described_class.new}

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'should instruct a plane to land at the airport' do
    plane = Plane.new
    expect(airport.land(plane)).to include(plane)
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  it 'should confirm a plane is no longer at the airport' do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:stormy?).and_return false
    expect(airport.take_off(plane)).to eq "#{plane} has buggered off."
  end

  it 'should prevent landing when airport is full' do
    plane = Plane.new
    Airport::DEF_CAPACITY.times { subject.land(plane) }
    expect{ airport.land (plane) }.to raise_error("Go away. Airport is full.")
  end

  it 'should evaluate whether it is stormy or not at the airport' do
    airport = Airport.new
    expect(airport.stormy?).to be(true).or be(false)
  end


  it 'should send an error message to say it is too stormy to take off' do
    plane = Plane.new
    subject.take_off(plane)
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.take_off (plane) }.to raise_error "Weather looks a bit mental best not to take off."
  end

end
