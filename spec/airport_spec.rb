require './lib/airport.rb'

describe Airport do
it { expect(Airport.new).to respond_to(:land) }
it { is_expected.to respond_to(:stand_by).with(1).argument }
end

describe Airport do
 it 'returns landed plane' do
  plane = Plane.new
  subject.stand_by(plane)
  expect(subject.plane).to eq plane
 end
end

#
# it { is_expected.to respond_to(:plane) }
