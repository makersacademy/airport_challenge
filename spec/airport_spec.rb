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
    # full_airport = Airport.new
    # populate that array @hangar
    Airport::CAPACITY.times { subject.land(Plane.new) }
    # plane43 = Plane.new
    expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
  end

  it "can be initialized with a custom capacity" do
    airport = Airport.new(11)
    expect(airport.capacity).to eq 11
  end
end
