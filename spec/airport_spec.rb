require 'airport'

describe Airport do

  it { is_expected.to be_a Airport }

  it "has a hangar array to store planes" do
    expect(subject.hangar).to be_a Array
  end

  it "stores a plane in hangar after landing" do 
    Plane.new.land(subject)
    expect(subject.hangar.size).to eq 1
  end

  it "can confirm a plane is at the airport" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.contains?(plane)).to be true
  end

  it "can confirm a plane is no longer at the airport" do
    plane = Plane.new
    plane.land(subject)
    plane.take_off(subject)
    expect(subject.contains?(plane)).to be false
  end

  it "can accept 10 planes" do
    airport = Airport.new
    10.times { Plane.new.land(airport) }
    expect(airport.hangar.size).to eq 10
  end

  it "prevents landing when the airport is full" do
    airport = Airport.new
    10.times { Plane.new.land(airport) }
    expect { Plane.new.land(airport) }.to raise_error "Landing not permitted: airport full!"
  end

  it "allows landing if a space becomes available" do
    airport = Airport.new
    10.times { Plane.new.land(airport) }
    airport.hangar.last.take_off(airport)
    expect { Plane.new.land(airport) }.not_to raise_error
  end

end
