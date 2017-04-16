require 'airport'
describe Airport do

  before do
    allow_any_instance_of(Weather).to receive(:status) { "sunny" }
  end

  it 'expects airport to be empty' do
    airport1 = Airport.new("Test_port")
    expect(airport1.planes == []).to eq true
  end

  it 'should have a default capacity of 20' do
    airport1 = Airport.new("Test_port")
    expect(airport1.capacity == 5).to eq true
  end

  it 'should have a capacity of 40' do
    airport1 = Airport.new("Test_port", 40)
    expect(airport1.capacity == 40).to eq true
  end

  it 'expects plane to be present' do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Test_plane")
    plane1.land(airport1)
    expect(airport1.landing_confirm(plane1) == "Confirmed: Test_plane has landed in Test_port").to eq true
  end

  it 'expects plane to be absent' do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Test_plane")
    expect(airport1.landing_confirm(plane1) == "Negative :Test_plane has not landed in Test_port").to eq true
  end

  it 'expects plane to have taken off' do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Test_plane")
    plane1.land(airport1)
    plane1.take_off(airport1)
    expect(airport1.take_off_confirmation(plane1) == "Confirmed: Test_plane has taken off from Test_port").to eq true
  end

  it 'expects plane to be grounded elsewhere' do
    airport1 = Airport.new("Test_port")
    airport2 = Airport.new("Dummy_port")
    plane1 = Plane.new("Test_plane")
    plane1.land(airport2)
    expect(airport1.take_off_confirmation(plane1) == "Negative: Test_plane isn't present at Test_port").to eq true
  end

  it 'expects plane to still be grounded' do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Test_plane")
    plane1.land(airport1)
    expect(airport1.take_off_confirmation(plane1) == "Negative: Test_plane has not taken off yet from Test_port").to eq true
  end

  it 'expects airport to be full' do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Dummy_plane_1")
    plane2 = Plane.new("Dummy_plane_2")
    plane3 = Plane.new("Dummy_plane_3")
    plane4 = Plane.new("Dummy_plane_4")
    plane5 = Plane.new("Dummy_plane_5")
    plane1.land(airport1)
    plane2.land(airport1)
    plane3.land(airport1)
    plane4.land(airport1)
    plane5.land(airport1)
    expect(airport1.full? == true).to eq true
  end

end
