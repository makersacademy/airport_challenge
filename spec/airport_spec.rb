require 'airport'

RSpec.describe Airport do

it {is_expected.to respond_to(:land)}

it 'is expected to #land a new plane' do
plane = double(:plane)
expect(subject.land(plane)).to eq(plane)
end

it 'is expected to respond to #run_way with landed plane' do
plane = double(:plane)
subject.land(plane)
expect(subject.run_way).to eq(plane)
end
end
