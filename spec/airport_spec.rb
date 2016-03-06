require 'airport'

describe Airport do

it { is_expected.to respond_to(:plane) }

it 'tells plane to land and puts in storage' do
  plane = double(:plane, landed?:false)
  subject.land(plane)
  expect(subject.storage.size).to eq 1
end


it 'takes plane out of storage after take off' do
  plane = double(:plane, landed:true, taken_off:false)
  weather = double(:weather, stormy:"sunny")
  subject.take_off(plane)
  expect(subject.storage.size).to eq 0
end

it 'does not let plane take off if weather is stormy' do
  plane = plane = double(:plane, landed?:false, taken_off:true)
  weather = double(:weather, stormy:"stormy")
  expect{ subject.take_off(plane) }.to raise_error "no take off due to storm"
end


end
