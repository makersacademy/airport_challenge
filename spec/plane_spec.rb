require 'plane'
describe Plane do
  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane.status).to eq 'flying'
  end

  it 'has a flying status when in the air' do
    plane.flying
    expect(plane.status).to eq 'flight in progress'
  end

  it 'has a status of flying when taking off' do
    plane.takeoff
    expect(plane.status).to eq 'flying'
  end

  it 'has a status of landed when landed' do
    plane.land
    expect(plane.status).to eq 'landed'
  end

end
