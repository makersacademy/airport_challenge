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

end
