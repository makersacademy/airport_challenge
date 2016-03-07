require 'airport'

describe Airport do

  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

it 'tells plane to land and puts in storage' do
  allow(weather).to receive(:stormy?) {"sunny"}
  allow(plane).to receive(:landed) {false}
  allow(plane).to receive(:land) {true}
  subject.land(plane, weather)
  expect(subject.storage.size).to eq 1
end

it 'takes plane out of storage after take off' do
  allow(weather).to receive(:stormy?) {"sunny"}
  allow(plane).to receive(:landed) {false}
  allow(plane).to receive(:land) {true}
  subject.land(plane, weather)
  allow(plane).to receive(:landed) {true}
  allow(plane).to receive(:take_off) {true}
  subject.take_off(plane, weather)
  expect(subject.storage.size).to eq 0
end

it 'does not let plane take off if weather is stormy' do
  allow(weather).to receive(:stormy?).and_return("stormy")
  expect{ subject.take_off(plane, weather) }.to raise_error "no take off due to storm"
end

it 'does not let plane land if weather is stormy' do
  allow(weather).to receive(:stormy?) { "stormy" }
  expect{ subject.land(plane, weather) }.to raise_error "no landing due to storm"
end

it 'does not land plane is airport is full' do
  allow(weather).to receive(:stormy?).and_return("sunny")
  allow(plane).to receive(:landed).and_return(false)
  allow(plane).to receive(:land).and_return(true)
  Airport::DEFAULT_CAPACITY.times {subject.land(plane, weather)}
  expect {subject.land(plane, weather) }.to raise_error "no space to land plane"
end

it 'creates an airport with capacity of 50' do
  subject.capacity = 50
  expect(subject.capacity).to eq 50
end

it 'does not land plane if it has already landed' do
  allow(weather).to receive(:stormy?).and_return("sunny")
  allow(plane).to receive(:landed).and_return(true)
  expect{ subject.land(plane, weather) }.to raise_error "plane has already landed"
end

it 'does not take off plane if it has already taken off' do
  allow(weather).to receive(:stormy?).and_return("sunny")
  allow(plane).to receive(:landed).and_return(false)
  expect{ subject.take_off(plane, weather) }.to raise_error "plane has already taken off"
end

end
