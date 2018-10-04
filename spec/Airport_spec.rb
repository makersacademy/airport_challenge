require './Airport.rb'

describe Airport do
  
  it 'exists' do
    expect(Airport.new).not_to eq nil
  end

  it 'has the ability to land a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  it 'allows a plane to take off, removes from airport' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(@plane).to eq nil
  end
  
end