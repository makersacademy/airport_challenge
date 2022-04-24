require 'airport'
describe Airport do
  it 'can create a new instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end


  it 'can respond to land' do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'can respond to takeoff' do
    plane = Plane.new 
    airport = Airport.new
    expect(airport). to respond_to(:takeoff).with(1).argument
  end
  



end 