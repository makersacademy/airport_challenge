require 'airport'

describe Airport do

  it { is_expected.to be_an_instance_of(Airport) }

  it "should not instantiate an airport if airport space is not an integer" do
    expect { Airport.new("Not a number") }.to raise_error "You did not specify a number for your airport spaces!"
  end

  it "should accept 'land' method for landing" do
    plane = double("plane")
    expect(subject).to respond_to(:accept_landing).with(1).argument
  end

  it "should only accept an instance of 'Plane' for landing" do
    fake_plane = double("not_a_plane")
    expect { subject.accept_landing(fake_plane) }.to raise_error "Not a plane, please do not land!"
  end

  it "should raise an error saying that the airport is full" do
    plane = Plane.new
    full_airport = Airport.new(20)
    expect { full_airport.accept_landing(plane) }.to raise_error "Airport is full!"
  end
end
