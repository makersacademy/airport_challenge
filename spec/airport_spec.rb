require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
    #check whether the airport class has a method called "land" that requires 1 argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    #check whether the plane istance is stored once it has landed
  end

  it 'take-off' do
    plane = Plane.new
    expect(subject.take_off.class).to eq plane.class
    #check whether a plane is created when take off is called
  end

end
