require 'airport'

RSpec.describe do

  it 'can create a airport' do
    airport = Airport.new

    expect(airport.class).to eq(Airport)
  end

  it 'responds to #take_off' do
    airport = Airport.new

    expect(airport).to respond_to(:take_off)
  end

  it 'can remove a plane from the inventory when taking off' do
    airport = Airport.new
    plane = Plane.new

    plane.land(airport)
    airport.take_off(plane)

    expect(airport.inventory.size). to eq(0)
  end

  it 'confirms that the plane has taken off after #take_off is called' do
    airport = Airport.new
    plane = Plane.new

    plane.land(airport)
    airport.take_off(plane)

    expect(plane.status).to eq("airborne")

  end

  it 'confirms a plane status has changeds to "airborne" after #take_off' do
    plane = Plane.new
    airport = Airport.new

    airport.take_off(plane)

    expect(airport.confirm_take_off(plane)).to eq(true)

  end

  it 'confirms a plane status has changeds to "airborne" after #take_off' do
    plane = Plane.new
    airport = Airport.new

    plane.land(airport)
    airport.take_off(plane)

    expect(airport.inventory.include?(plane)).to eq(false)
  end
end
