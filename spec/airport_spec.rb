require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
    #check whether the airport class has a method called "land" that requires 1 argument
  end

  it 'lands a plane' do
    subject.land(Plane.new)
    expect(subject.planes).to_not be_empty
    #check whether the plane instance is stored once it has landed
  end

  it 'does not land a plane if stormy' do
    subject.stormy?
    expect{subject.land(Plane.new)}.to raise_error ("Weather is stormy")
    #check weather is stormy before landing a plane
  end

  it 'allows a plane to take-off' do
    subject.land(Plane.new)
    subject.take_off
    expect(subject.planes).to be_empty
    #check whether a plane is created when take off is called
  end

  it 'take-off denined if stormy' do
    subject.stormy?
    expect{ subject.take_off}.to raise_error ("Weather is stormy")
    #check whether a plane is created when take off is called
  end

  it 'does not let a plane land if airport is full (capacity 20)' do
    20.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport full")
  end

end
