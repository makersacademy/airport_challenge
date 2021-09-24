require "plane"

RSpec.describe Plane do 
  let(:airport_jfk) { double :airport, :title => "JFK", :name => "New York JFK", :full? => true }
  let(:airport_lhr) { double :airport, :title => "LHR", :name => "London Heathrow", :full? => false } 
  let(:airport_svo) { double :airport, :title => "SVO", :name => "Moscow Sheremetyevo", :full? => false }  
  
  it "creates a new plane" do
    expect(Plane.new(airport_jfk)).to be_instance_of Plane
  end

  it "can set its destination" do
    plane = Plane.new(airport_jfk)
    expect(plane.next_destination(airport_lhr)).to eq "Fasten your seatbelts, please. We are ready to take off!"
  end

  it "raises an error when trying to take of without setting destination" do
    plane = Plane.new(airport_jfk)
    expect { plane.take_off }.to raise_error "Set destination first!"
  end

  it "can take off" do
    plane = Plane.new(airport_jfk)
    plane.next_destination(airport_lhr)
    expect(plane.take_off).to eq "Flying!"
  end

  it "raises an error when trying to land before taking off" do
    plane = Plane.new(airport_jfk)
    expect { plane.land_at(airport_lhr) }.to raise_error "Plane already landed at New York JFK!"
  end

  it "raises an error when trying to land at the full airport" do
    plane = Plane.new(airport_svo)
    plane.next_destination(airport_jfk)
    plane.take_off
    expect { plane.land_at(airport_jfk) }.to raise_error "Can't land at New York JFK airport. It's already full!"
  end

  it "lands in the airport if it is not full" do
    plane = Plane.new(airport_jfk)
    plane.next_destination(airport_svo)
    plane.take_off
    expect(plane.land_at(airport_svo)).to eq "Successfully landed at Moscow Sheremetyevo airport."
  end
end
