require 'plane'

describe Plane do
  plane = Plane.new

  it 'should be flying when it is created' do
    expect(plane).to be_flying
  end

  it 'should be able to land' do
    plane.land!
    expect(plane).not_to be_flying    
  end

end
