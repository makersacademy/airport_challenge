require 'airport'

describe Airport do

  it 'should respond to #land(plane)' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'allows planes to land' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'allows planes to take-off' do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include plane
  end

  it 'stops planes from taking-off in stormy weather' do

  end  

end
