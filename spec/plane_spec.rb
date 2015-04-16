require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"


describe Plane do
  let(:plane){Plane.new}

  it "has a flying status when created" do
    expect(plane.flying?).to eq true
  end

  it 'has a flying status when in the air' do
    plane.in_air!
    expect(plane.flying?).to eq true
  end

  it 'can land' do
    plane.landed!
    expect(plane.flying?).to eq false
  end

  it 'can land and take off' do
    plane.landed!
    plane.in_air!
    expect(plane.flying?).to eq true
  end



  # it "can land" do
  #   expect(plane.landing?)
  # end

  # accept take off
  #expect in_flight.to_be flying?

end
