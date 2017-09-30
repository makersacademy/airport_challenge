require 'plane'

describe Plane do
  let(:airport) { double(:airport) }
  let(:plane) { Plane.new }
  it "should be able to land at an airport if the weather conditions and the capacity allows it" do
    
    allow(airport).to receive(:request_to_land).and_return(true)
    expect(plane.land_at(airport)).to eq airport
  end

  it "shouldn't be able to land at an airport if the weather conditions or the capacity do not allow it" do
    allow(airport).to receive(:request_to_land).and_return(false)
    expect(plane.land_at(airport)).to eq nil 
  end

  it "should raise an error when a landed airplane tries to land" do
    allow(plane).to receive(:at_the_airport?).and_return(true)
    expect { plane.land_at(airport) }.to raise_error("Airplane cannot land while already landed")
  end

  it "should confirm that is no longer at the airport after take off" do
    allow(plane).to receive(:take_off).and_return(nil)
    expect(plane.at_the_airport?).to eq false
  end

  it "should raise an error when it the airplane trying to take off while flying" do
    allow(plane).to receive(:at_the_airport).and_return(false)
    expect { plane.take_off }.to raise_error("Airplane cannot take off while flying")
  end   

  it "should return nil if take off is successful" do
    allow(plane).to receive(:at_the_airport?).and_return(true)
    plane.instance_variable_set("@airport", airport)
    allow(airport).to receive(:request_to_take_off).and_return(true)
    expect(plane.take_off).to eq nil
  end
end
