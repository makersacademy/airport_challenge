require "plane"

RSpec.describe Plane do 

  let(:airport_jfk) { double :airport, :name => "New York JFK", :full? => false }
  let(:airport_lhr) { double :airport, :name => "London Heathrow", :full? => true } 
  let(:airport_svo) { double :airport, :name => "Moscow Sheremetyevo", :full? => false }  

  it "creates a new plane" do
    allow(airport_jfk).to receive(:land)
    expect(Plane.new(airport_jfk)).to be_instance_of Plane
  end

  it "raises an error if initializing at the full airport" do
    expect { Plane.new(airport_lhr) }.to raise_error "Airport is full!"
  end

  it "can set destination" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    expect(plane.next_destination(airport_lhr)).to eq "Fasten your seatbelts, please. We are ready to take off!"
  end

  it "raises an error if trying to set current location as next destination" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    expect { plane.next_destination(airport_jfk) }.to raise_error "Plane is already in the New York JFK airport!"
  end

  it "raises an error when trying to take of without setting destination" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    expect { plane.take_off }.to raise_error "Set destination first!"
  end

  it "can take off in sunny weather" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    plane.next_destination(airport_lhr)

    allow(airport_jfk).to receive(:departure)
    allow(airport_jfk).to receive(:stormy?).and_return false

    expect(plane.take_off).to eq "Flying!"
  end

  it "raises an error when trying to take off in stormy weather" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    plane.next_destination(airport_lhr)

    allow(airport_jfk).to receive(:stormy?).and_return true

    expect { plane.take_off }.to raise_error "Can't take off due to the weather condition. It's stormy outside!"
  end

  it "raises an error when trying to land before taking off" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    expect { plane.land_at(airport_lhr) }.to raise_error "Plane already landed at New York JFK!"
  end

  it "raises an error when trying to land at the full airport" do
    allow(airport_svo).to receive(:land)
    plane = Plane.new(airport_svo)
    plane.next_destination(airport_lhr)

    allow(airport_svo).to receive(:departure)
    allow(airport_svo).to receive(:stormy?).and_return false

    plane.take_off

    expect { plane.land_at(airport_lhr) }.to raise_error "Can't land at London Heathrow airport. It's already full!"
  end

  it "lands in the airport if it is not full and the weather is sunny" do
    allow(airport_jfk).to receive(:land)
    plane = Plane.new(airport_jfk)
    plane.next_destination(airport_svo)

    allow(airport_jfk).to receive(:stormy?).and_return false
    allow(airport_jfk).to receive(:departure)
    allow(airport_svo).to receive(:stormy?).and_return false
    allow(airport_svo).to receive(:land)

    plane.take_off

    expect(plane.land_at(airport_svo)).to eq "Successfully landed at Moscow Sheremetyevo airport."
  end
end
