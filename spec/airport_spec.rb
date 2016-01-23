require 'airport'
require 'plane'

describe Airport do
  let(:plane) {double(:plane)}

  it 'lands a plane' do
    allow(subject).to receive(:weather) {:fine}
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'instructs planes to take off' do
  allow(subject).to receive(:weather) {:fine}
  subject.land(plane)
  allow(subject).to receive(:weather) {:fine}
  subject.take_off(plane)
  expect(subject.planes).to eq []
  end

  it 'prevents take off if weather is stormy' do
    allow(subject).to receive(:weather) {:fine}
  subject.land(plane)
  allow(subject).to receive(:weather) {:stormy}
  expect {subject.take_off(plane)}.to raise_error('weather is stormy')
  end

  it 'prevents landing if weather is stormy' do
  allow(subject).to receive(:weather) {:stormy}
  expect {subject.land(plane)}. to raise_error('weather is too stormy to land')
end

it 'prevents planes that have already landed to land again!' do
    allow(subject).to receive(:weather) {:fine}
    subject.land(plane)
    expect {subject.land(plane)}.to raise_error('plane is already in the airport')
  end

  it 'prevents planes landing if airport is at max capacity' do
    allow(subject).to receive(:weather) {:fine}
    allow(subject).to receive(:at_capacity?) {true}
    expect {subject.land(plane)}.to raise_error("airport at max capacity")
  end

  it 'sets a default capacity' do
    expect(subject.capacity).to eq 20
  end

  it 'allows user to set a different capacity at instantiation' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end
end