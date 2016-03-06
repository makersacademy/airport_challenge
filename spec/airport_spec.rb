require 'airport'

describe Airport do

it { is_expected.to respond_to(:plane) }

it 'tells plane to land and puts in storage' do
  plane = double(:plane, landed?:false)
  subject.land(plane)
  expect(subject.storage.size).to eq 1
end

it 'takes plane out of storage after take off' do
  plane = double(:plane, taken_off:true)
  weather = double(:weather, stormy?:"sunny")
  subject.take_off(plane)
  expect(subject.storage.size).to eq 0
end

# it 'does not let plane take off if weather is stormy' do
#   plane = double(:plane, taken_off:true)
#   weather = double(:weather, stormy?:"stormy")
#   expect{ subject.take_off(plane) }.to raise_error "no take off due to storm"
# end

# it 'does not let plane land if weather is stormy' do
#   plane = double(:plane, landed?:false)
#   weather = double(:weather, stormy?:"stormy")
#   expect{ subject.land(plane) }.to raise_error "no landing due to storm"
# end

it 'does not land plane is airport is full' do
  Airport::DEFAULT_CAPACITY.times {subject.land double(:plane, landed?:false)}
  expect {subject.land double(:plane) }.to raise_error "no space to land plane"
end

it 'creates an airport with capacity of 50' do
  subject.capacity = 50
  expect(subject.capacity).to eq 50
end

end
