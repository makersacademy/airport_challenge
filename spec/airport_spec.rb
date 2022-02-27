require 'airport'

describe Airport do
  it 'responds to land with 1 argument passed' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  
  it 'lands a plane' do
    plane = Plane.new
    # We want to return the plane we land
    expect(subject.land(plane)).to eq plane
  end

  it 'takes off a plane and confirms it has taken off' do # I'm not sure if this test and corresponding method is doing too much
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq("#{plane} has taken off")
  end

end
