require 'plane.rb'

describe Plane do

  it {is_expected.to respond_to(:land).with(1).argument}

  it "airport confirms that the plane has landed" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.plane).to eq (subject)
  end

end
