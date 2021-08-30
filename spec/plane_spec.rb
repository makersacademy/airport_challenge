require 'plane'

describe 'Plane' do
  let(:plane) { Plane.new }
  
  it 'Should be able to land when instructed' do
    expect(plane).to respond_to(:land)
  end
    
  it 'Should land when instructed' do
    plane.land
  end
    
end
