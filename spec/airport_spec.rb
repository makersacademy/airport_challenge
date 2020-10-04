require 'airport'

describe Airport do

  it 'commands a plane to land' do
    heathrow = Airport.new
    ba = Plane.new
    heathrow.land('ba')
    expect(heathrow).to respond_to(:land).with(1).argument
  end

end