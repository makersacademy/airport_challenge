require 'airport'

describe Airport do
  it { should respond_to :plane_at_airport? }

  # it 'should take an instance of a plane, and return true if plane_has_left_airport?' do
  #   airport = Airport.new
  #   plane = Plane.new
  #   plane = plane.take_off
  #   expect(airport.plane_has_left_airport?(plane)).to eq true
  # end

  it 'should take a plane that has taken off, and return true' do
    airport = Airport.new
    plane = Plane.new
    plane = plane.take_off
    expect(airport.plane_at_airport?(plane)).to eq true
  end


end
