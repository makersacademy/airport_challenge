require "air_traffic_controller"

describe AirTrafficController do
  it "Checks the Default capacity" do
    expect(subject.capacity).to eq(10)
  end

  it "Plane landing" do
    #Act
    plane = double(:plane)
    #Arrange
    subject.plane_landing(plane)
    #Asert
    expect(subject.hanger).to include(plane)
  end

  it "Plane taking off" do
    #Act
    plane = double(:plane)
    #Arrange
    subject.plane_landing(plane)
    subject.plane_taking_off(plane)
    #Asert
    expect(subject.hanger).to_not include(plane)
  end

  it "Hanger is full of planes" do
    #Act
    plane = double(:plane)
    #Arrange
    subject.capacity.times { subject.plane_landing(plane) }
    #Asert
    expect { raise subject.plane_landing(plane) }.to raise_error "hanger full"
  end

end
