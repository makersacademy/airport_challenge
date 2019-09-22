require 'airport'

feature Airport, :type => :feature do
  subject(:airport) { described_class.new(weather, 2) }
  let(:weather) { double(:weather, stormy?: false) }

  scenario 'User instructs multiple planes to land' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    expect(airport.landed_planes).to include plane1
    expect(airport.landed_planes).to include plane2
  end
  
  scenario 'User instructs to land more planes than capacity allows' do
    airport.capacity.times { airport.land(Plane.new) }
    message = 'No extra space!'
    expect { airport.land(Plane.new) }.to raise_error message
  end
  
  scenario 'User instructs multiple planes to take off' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.take_off(plane1)
    airport.take_off(plane2)
    expect(airport.landed_planes).not_to include plane1
    expect(airport.landed_planes).not_to include plane2
  end
end