require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
    #check whether the airport class has a method called "land" that requires 1 argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    #check whether the plane instance is stored once it has landed
  end

  it 'lands a plane if stormy' do
    subject.stormy?
    expect{subject.land(Plane.new)}.to raise_error ("Weather is stormy")
    #check weather is stormy before landing a plane
  end

  it 'take-off' do
    plane = Plane.new
    expect(subject.take_off.class).to eq plane.class
    #check whether a plane is created when take off is called
  end

  it 'take-off denined if stormy' do
    subject.stormy?
    expect{ subject.take_off}.to raise_error ("Weather is stormy")
    #check whether a plane is created when take off is called
  end

end
