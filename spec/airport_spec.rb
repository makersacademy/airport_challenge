require 'airport'
require 'plane'

describe Airport do

   before(:each) do
      @airport = Airport.new
      @plane = Plane.new
      allow(@airport).to receive_messages(:stormy => false)
  end

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:stormy) }


  it "creates an airport" do
    expect(described_class).to eq Airport
  end

  it "creates an airport with a default capacity of 10 planes by default" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "creates an airport with a capacity of an arugment given" do
    airport = Airport.new(15)
    expect(airport.capacity).to eq 15
  end

  it "prevents landing when the airport is full " do
    Airport::DEFAULT_CAPACITY.times do
      @airport.land(Plane.new)

    end
      expect{@airport.land(Plane.new)}.to raise_error "Airport is full."
    end

  it "raises an error when a take-off is requested from an empty airport" do
    @planes = 0
    expect{@airport.take_off(@plane)}.to raise_error "Airport is empty"
  end

  it "raises an error when a requested plane is not in the airport to take off" do
    plane2 = Plane.new
    @airport.land(plane2)
    expect{@airport.take_off(@plane)}.to raise_error "That plane is not at this airport"
  end

   it "allows a specific plane to take off when requested" do
     plane2 = Plane.new
     @airport.land(@plane)
     @airport.land(plane2)
     @airport.take_off(@plane)
     expect(@airport.planes).not_to include(@plane)
  end

  it "only lets you land a plane once at an airport" do
    @airport.land(@plane)
    @airport.stormy = false
    expect{@airport.land(@plane)}.to raise_error "That plane has already landed."
  end


  it "raises an error when you try to land in stormy conditions" do
    allow(@airport).to receive_messages(:stormy => true)
    expect{@airport.land(@plane)}.to raise_error "The weather is too bad. Try again later."
  end

  it "raises an error when you try to take_off in stormy conditions" do
    allow(@airport).to receive_messages(:stormy => true)
    @airport.land(@plane)
    expect{@airport.take_off(@plane)}.to raise_error "The weather is too bad. Try again later."
  end

end
