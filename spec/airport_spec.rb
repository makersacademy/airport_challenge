require 'airport'

describe AirPort do

  it { is_expected.to respond_to(:full?) }

  it "when a capacity of '7' is specified in initialisation, capacity will equal '7' " do
    expect(AirPort.new(7).capacity).to eq 7
  end
  it "when airport is below capacity .full? returns false" do
    expect(AirPort.new.full?).to eq false
  end
  it "when airport is at capacity .full? returns true" do
    airport = AirPort.new(1)
    plane = AirPlane.new
    airport.dock(plane)
    expect(airport.full?).to eq true
  end
  it "when airport is empty , empty? returns true" do
    expect(AirPort.new.empty?).to eq true
  end
  it "when airport is not empty .empty? returns false" do
    airport = AirPort.new(1)
    plane = AirPlane.new
    airport.dock(plane)
    expect(airport.empty?).to eq false
  end
  it ".dock returns fail message when non-plane is attempted to be docked" do
    expect(AirPort.new.dock(Object.new)).to eq "can only dock planes"
  end
  it ".dock returns fail message if airport full" do
    airport = AirPort.new(1)
    plane = AirPlane.new
    airport.dock(plane)
    expect(airport.dock(AirPlane.new)).to eq "airport full, cannot dock"
  end
  it ".dock docks a plane" do
    airport = AirPort.new(1)
    plane = AirPlane.new
    expect(airport.dock(plane)).to eq [plane]
  end
  it ".index_of_plane returns -1 if plane not in aiport" do
    expect(AirPort.new.index_of_plane(AirPlane.new)).to eq -1
  end
  it ".index_of_plane returns index of plane if plane is docked in airport" do
    airport = AirPort.new
    plane0 = AirPlane.new
    plane1 = AirPlane.new
    airport.dock(plane0)
    airport.dock(plane1)
    expect(airport.index_of_plane(plane1)).to eq 1
  end
  it ".take_off returns error message if specified plane not in airport" do
    airport = AirPort.new
    plane0 = AirPlane.new
    plane1 = AirPlane.new
    airport.dock(plane0)
    allow(airport).to receive(:chance).and_return(1)
    expect(airport.take_off(plane1)).to eq "specified plane not in airport"
  end
  it ".take_off removes specified plane from airport" do
    airport = AirPort.new
    plane0 = AirPlane.new
    airport.dock(plane0)
    allow(airport).to receive(:chance).and_return(1)
    airport.take_off(plane0)
    expect(airport.planes).to eq []

  end
  it ".take_off returns error message when weather is stormy" do
    airport = AirPort.new
    plane0 = AirPlane.new
    airport.dock(plane0)
    allow(airport).to receive(:chance).and_return(0)
    expect(airport.take_off(plane0)).to eq "stormy weather, cannot take off"

  end
  it ".take_off changes inair to true of specified plane taking off" do
    airport = AirPort.new
    plane0 = AirPlane.new
    airport.dock(plane0)
    allow(airport).to receive(:chance).and_return(1)
    airport.take_off(plane0)
    expect(plane0.inair).to eq true
  end
  it 'stormy? returns false when rand(5) > 0' do
  airport = AirPort.new
  allow(airport).to receive(:chance).and_return(1)
  expect(airport.stormy?).to eq(false)
  end
  it 'stormy? returns true when rand(5) == 0' do
  airport = AirPort.new
  allow(airport).to receive(:chance).and_return(0)
  expect(airport.stormy?).to eq(true)
  end

end
