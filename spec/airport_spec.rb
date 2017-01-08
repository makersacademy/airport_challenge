require './lib/airport.rb'

describe Airport do
describe '#land_plane' do
  it {is_expected.to respond_to :land_plane }
  it 'actively lands planes' do
  plane = Airplane.new
  subject.land_plane(plane)
  expect(subject.landed_planes).to include(plane)
  end
  it 'prints confirmation of landing' do
    plane = Airplane.new
    expect(subject.land_plane(plane)).to include("The plane has landed")
  end
end
end
