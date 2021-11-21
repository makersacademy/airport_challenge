require 'airport'

describe Airport do

  # it { is_expected.to respond_to :initialize}

  it "has an initialize method with a default capacity of 42" do 
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
    # NoMethodError:
    #    undefined method `each' for 42:Integer
    # had to swap and have the @hangar the last value in initialize -> why
    allow(airport).to receive_messages([])
    expect(airport.capacity).to eq 42
  end

  it "can instruct planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can instruct planes to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raise an error when at full capacity" do
    # populate that array @hangar
    Airport::CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
  end

  it "raises an error when a plane which isn't in the hangar tries to take off" do
    plane = Plane.new
    expect { subject.take_off(plane) }.to raise_error 'this plane is not in this Airport'
  end

  it "can be initialized with a custom capacity" do
    airport = Airport.new(11)
    expect(airport.capacity).to eq 11
  end
end
