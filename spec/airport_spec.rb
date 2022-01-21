require 'airport' 
  
describe Airport do
  it 'allows a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(subject).to respond_to(:land).with(1).argument
  end  

  it 'allows plane to take off and confirms gone'
    airport = Airport.new
    plane = Plane.new
    expect

end
