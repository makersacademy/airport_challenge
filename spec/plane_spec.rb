require 'plane'

describe Plane do

  #EDGE CASE #2 - prevent take off if flying
  it "responds to #flying" do
    expect(subject).to respond_to(:flying)
  end

end
