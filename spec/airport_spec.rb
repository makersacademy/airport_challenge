require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

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
      subject.land(Plane.new)
    end
      expect{subject.land(Plane.new)}.to raise_error "Airport is full."
    end

  it "raises an error when a take-off is requested from an empty airport" do
    plane1 = Plane.new
    @plane == 0
    expect{subject.take_off(plane1)}.to raise_error "Airport is empty"
  end


  it "raises an error when a requested plane is not in the airport to take off" do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land(plane2)
    expect{subject.take_off(plane1)}.to raise_error "That plane is not at this airport"
  end

  # it "allows planes to take-off" do
  #   plane1 = Plane.new
  #   subject.land(plane1)
  #   expect(subject.take_off(plane1).to eq plane1
  # end

   it "allows a specific plane to take off when requested" do
     plane1 = Plane.new
     plane2 = Plane.new
     subject.land(plane1)
     subject.land(plane2)
     subject.take_off(plane1)
     new_array = @planes.delete(plane1)
     expect(@planes).to eq new_array
  end

  it "only lets you land a plane once at an airport" do
    plane1 = Plane.new
    subject.land(plane1)
    expect{subject.land(plane1)}.to raise_error "That plane has already landed."
  end

  it "raises an error when you try to land in stormy conditions" do
    plane1 = Plane.new
    airport1 = Airport.new(5,true)
    expect{airport1.land(plane1)}.to raise_error "The weather is too bad. Try again later."
  end

  it "raises an error when you try to take_off in stormy conditions" do
    plane1 = Plane.new
    airport1 = Airport.new(5,true)
    @planes = [plane1]
    expect{airport1.take_off(plane1)}.to raise_error "The weather is too bad. Try again later."
  end

end
