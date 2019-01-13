require 'plane'

describe Plane do
  #EDGE CASE #2 - prevent take off if flying
  it "responds to #flying? check" do
    expect(subject).to respond_to(:flying?)
  end
  
end
