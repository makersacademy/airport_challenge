require 'airport' 
  
describe Airport do
  it 'allows a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(subject).to respond_to(:land).with(1).argument
  end  

  it 'allows plane to take off and confirms gone' do
    airport = Airport.new
    plane = Plane.new
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'prevents a plane landing when airport full' do
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect{subject.land(plane)}.to raise_error "Cannot land, airport full!"
  end

  it 'allows the system designer to override capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end