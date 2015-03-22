require 'plane'

describe Plane do
  plane = Plane.new

  it 'has a \'flying\' status when created' do
    expect(plane.status).to eq 'flying'
  end

  it 'is located in the air when created' do
    expect(plane.location).to eq 'air'
  end

  it 'can \'request to land\'' do
    expect(plane).to respond_to :request_land
  end

  it 'responds to \'land\'' do
    expect(plane).to respond_to :land
  end

  it 'has a status of \'landed\' after landing' do
    plane.land
    expect(plane.status).to eq 'landed'
  end

  it 'does not respond to \'land\' after landing' do
    expect { (plane.land) }.to raise_error 'already landed'
  end

  it 'responds to \'takeoff\'' do
    expect(plane).to respond_to :takeoff
  end

  it 'can \'request to takeoff\'' do
    expect(plane).to respond_to :request_takeoff
  end

  it 'changes its status to \'flying\' after takeoff' do
    plane.takeoff
    expect(plane.status).to eq 'flying'
  end

  it 'does not respond to \'takeoff\' after takeoff' do
    expect { (plane.takeoff) }.to raise_error 'already flying'
  end
end
