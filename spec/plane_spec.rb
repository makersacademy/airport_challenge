require 'plane'

describe Plane do
  let (:plane) {Plane.new :destination}
  #it 'is flying when created'
  it 'is flying when created' do
    plane
    expect(plane).to be_flying
  end

  #it 'can land'
  it 'can land' do
    plane.can_land
    expect {plane.can_land}.to raise_error
      'Can not land if it is not flying'
  end

  #it 'is landed after landing'
  it 'is landed after landing' do
  	plane.can_land
    plane.landed?
  	expect(plane).to be_landed
  end

  #it 'can take off'
  it 'can take off' do
    expect {plane.can_take_off}.to raise_error
      'Can not take off if it is not landed'
  end

  #it 'is flying after take off'
  it 'is flying after take off' do
    plane.can_land
    plane.can_take_off
    expect(plane).to be_flying
  end
end
