require 'airport'

describe Airport do

  it { is_expected.to be_a Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "has a hangar array to store planes" do
    expect(subject.hangar).to be_a Array
  end

  it "stores a plane in hangar after landing" do 
    subject.land(Plane.new)
    expect(subject.hangar.size).to eq 1
  end

  it "can confirm a plane is at the airport" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.contains?(plane)).to be true
  end

  it "can confirm a plane, after taking off, is no longer at the airport" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.contains?(plane)).to be false
  end

  it "can accept 10 planes" do
    airport = Airport.new
    10.times { airport.land(Plane.new) }
    expect(airport.hangar.size).to eq 10
  end

  it "prevents landing when the airport is full" do
    airport = Airport.new
    airport.capacity.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Landing not permitted: airport full!"
  end

  it "allows landing if a space becomes available" do
    airport = Airport.new
    airport.capacity.times { airport.land(Plane.new) }
    airport.take_off(airport.hangar.last)
    expect { airport.land(Plane.new) }.not_to raise_error
  end

  it "can tell user the airport capacity and confirm default capacity" do
    expect(subject.capacity).to eq 10
  end

  it "allows user to set custom capacity when instantiating new airport object" do
    big_airport = Airport.new(100)
    expect(big_airport.capacity).to eq 100
  end

  it "accepts only positive integers as capacity" do
    [0, -3, "1", 4.5, true, []].each do |bad_capacity|
      expect { Airport.new(bad_capacity) }.to raise_error "Airport capacity must be a positive integer"
    end
  end
    
end
