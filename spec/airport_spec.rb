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

    expect(airport.confirm_take_off(plane)).to eq("The plane has taken off")

  end

  it 'confirms a plane status has changeds to "airborne" after #take_off' do
    plane = Plane.new
    airport = Airport.new

    plane.land(airport)
    airport.take_off(plane)

    expect(airport.inventory.include?(plane)).to eq(false)
  end 
  
  it 'has a maximum capacity' do
    airport = Airport.new

    expect(airport).to respond_to(:capacity)
  end

  it 'can respond to #modify_capacity' do
    airport = Airport.new

    expect(airport).to respond_to(:modify_capacity)
  end

  it 'can modify the airport\'s capacity' do
    airport = Airport.new

    airport.modify_capacity(100)

    expect(airport.capacity).to eq(100)
  end
end
