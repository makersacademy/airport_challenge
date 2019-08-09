require 'airport'
describe Airport do
  it 'can create an instance of a airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'can create an instance of a plane' do
    airport = Airport.new
    expect(airport).to include(:plane)
  end

  it 'should show a plane has landed' do
    airport = Airport.new
    expect(airport.plane).to exist(:landed)
  end

  it 'should check planes at the airport' do
    airport = Airport.new
    expect(airport.plane.landed).to eq(:landed)
  end

  it 'should remove a plane when it has taken off' do
    airport = Airport.new
    airport.plane.landed
    ariport.takenoff(plane)
    airport.takenoff = planes
  end

  it 'should say if a empty if plane has taken off' do
    airport = Airport.new
    ariport.takenoff(plane)
    expect(airport.plane(plane)).to be false
  end
end
