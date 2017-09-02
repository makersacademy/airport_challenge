require 'Airport'

describe 'Airport' do
  it 'lands planes at airport' do
    airport = Airport.new
    plane = Plane.new
    expect (subject.land(plane)).to respond_to(:land)
  end
end
