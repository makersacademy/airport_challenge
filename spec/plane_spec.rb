# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport and confirm that it has landed 

class Plane
  
  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def landed?
    @landed
  end

end

describe 'plane' do
  it 'can land at an airport and confirms it has landed' do
    plane = Plane.new
    plane.land
    expect(plane.landed?).to be true 
  end
  it 'does not land unless instructed to land' do
    plane = Plane.new
    expect(plane.landed?).to be false
  end
end
