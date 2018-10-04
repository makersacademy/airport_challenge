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
  
end