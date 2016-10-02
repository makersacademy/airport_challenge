# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport and confirm that it has landed 

class Plane
  def landed?
    true
  end
end

describe 'plane' do
  it 'can land at an airport and confirms it has landed' do
    plane = Plane.new
    expect(plane.landed?).to be true
     
  end
end
