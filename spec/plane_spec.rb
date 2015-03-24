require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it 'has a \'flying\' status when created' do
    expect(plane.status).to eq 'flying'
  end

  it 'is located in the air when created' do
    expect(plane.location).to eq 'air'
  end

  it 'can \'request to land\' at airport' do
    airport = double :airport, landing_permission: true
    expect(plane.request_land airport).to eq true
  end

  it 'responds to \'land\'' do
    expect(plane).to respond_to :land
  end

  it 'has a status of \'landed\' after landing' do
    plane.land :airport
    expect(plane.status).to eq 'landed'
  end

  it 'does not respond to \'land\' after landing' do
    plane.land :airport
    expect { (plane.land :airport) }.to raise_error 'already landed'
  end

  it 'responds to \'takeoff\'' do
    plane.land :airport
    expect(plane).to respond_to :takeoff
  end

  it 'can \'request to takeoff\'' do
    plane.land :airport
    expect(plane).to respond_to :request_takeoff
  end

  it 'changes its status to \'flying\' after takeoff' do
    plane.land :airport
    plane.takeoff
    expect(plane.status).to eq 'flying'
  end

  it 'does not respond to \'takeoff\' after takeoff' do
    plane.land :airport
    plane.takeoff
    expect { (plane.takeoff) }.to raise_error 'already flying'
  end
end
