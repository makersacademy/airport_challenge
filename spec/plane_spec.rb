require 'planes.rb'

describe Plane do
  it 'planes have a record of their position attached' do
    expect(subject).to respond_to(:position)
  end

  it 'changes the position of a plane if it lands' do
    test_plane1 = Plane.new
    test_airport1 = Airport.new("BER")
    test_airport1.land_plane(test_plane1)

    expect(test_plane1.position).to eq "BER"
  end

  it 'changes the position of a plane if it takes off' do
    test_plane1 = Plane.new("BER")
    test_airport1 = Airport.new("BER")
    test_airport1.plane_take_off(test_plane1)

    expect(test_plane1.position).to eq "airbourne"
  end
end
