require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) {double(:plane)}
  it 'lands planes and confirms they\'re there' do
    plane = Plane.new
    allow(subject).to receive(:weather) {:fine}
    subject.land(plane)
    subject.planes
  end

  it 'instructs planes to take off and confirm they\'re gone' do
    allow(subject).to receive(:weather) {:fine}
    subject.land(plane)
    subject.planes
    allow(subject).to receive(:weather) {:fine}
    subject.take_off(plane)
    expect(subject.planes).to eq []
  end

  it 'prevents planes from taking off if weather is stormy' do
    allow(subject).to receive(:weather) {:fine}
    subject.land(plane)
    allow(subject).to receive(:weather) {:stormy}
    expect {subject.take_off(plane)}.to raise_error('weather is stormy')
  end

  it 'prevents landing if weather is stormy' do
    allow(subject).to receive(:weather) {:stormy}
    expect {subject.land(plane)}. to raise_error('weather too stormy to land')
  end

  it 'prevents planes that have already landed to land again!' do
    allow(subject).to receive(:weather) {:fine}
    subject.land(plane)
    expect {subject.land(plane)}.to raise_error('plane already in the airport')
  end

  it 'prevents planes landing if airport is at max capacity' do
    allow(subject).to receive(:weather) {:fine}
    allow(subject).to receive(:at_capacity?) {true}
    expect {subject.land(plane)}.to raise_error("airport at max capacity")
  end

  it 'allows user to set a different capacity at instantiation' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end
end