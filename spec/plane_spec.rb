require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  describe :landed

  it {is_expected.to respond_to :landed}

  it "check if is landed" do
    plane = Plane.new
    plane.landed
    expect(@landed==true)
  end

    it "check if is not flying" do
    plane = Plane.new
    plane.landed
    expect(@flying==false)
  end


  describe :flying

  it {is_expected.to respond_to :flying}

  it "check if is flying" do
    plane = Plane.new
    plane.flying
    expect(@flying==true)
  end

  it "check if is not landed" do
    plane = Plane.new
    plane.flying
    expect(@landed==false)
  end



  # xit 'is flying when created'

  # xit 'can land'

  # xit 'is landed after landing'

  # xit 'can take off'

  # xit 'is flying after take off'

end
