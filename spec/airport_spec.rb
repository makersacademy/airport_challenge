require 'airport'

describe Airport do
  it 'responds to land_at_airport' do
    airport = Airport.new
    plane = Plane.new
    subject.land_at_airport(plane)
    expect(subject).to respond_to :land_at_airport
  end

  it 'responds to take_off' do
    airport = Airport.new
    plane = Plane.new
    subject.take_off(plane)
    expect(subject).to respond_to :take_off
  end
  #
  # it 'confirms that plane is no longer in the airport' do
  #   plane = Plane.new
  #   subject.take_off(airport)
  #   expect(subject.take_off).to eq airport
  # end

end
