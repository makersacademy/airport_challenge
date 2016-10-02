require 'airport'

describe Airport do

  describe 'allows plane to land'
  it {is_expected.to respond_to(:land?).with(1).argument}

  describe 'allow plan to take_off'
  it {is_expected.to respond_to(:take_off?).with(1).argument}

  describe 'prevant plane from take_off if stormy'
  airport = Airport.new
  plane = Plane.new
  it {expect {airport.take_off?(plane)}.to raise_error("Cannot fly due to weather")if "Stormy" }

  describe 'prevant plane from land if stormy'
  airport = Airport.new
  plane = Plane.new
  it {expect {airport.land?(plane)}.to raise_error("Cannot land due to weather")if "Stormy" }

  describe "capacity default set to 1"
  it {expect(subject.specified_capacity).to eq 1}

end
