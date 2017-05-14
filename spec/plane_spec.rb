require 'plane.rb'

describe Plane do

  let(:airplane){double(:airplane)}
  it "can not land in another airport when already landed" do
    airport.land(subject)
    airport2 = double(airport2)
    expect{airport2.land(subject)}.to raise_error "The plane is already landed in another airport"

  end

end
