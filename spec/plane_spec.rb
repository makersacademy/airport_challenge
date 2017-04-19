require 'plane'

describe Plane do
  subject {described_class.new}

  it "only allows plane objects to be passed into methods" do
    expect{subject.in_airport(nil) ;
       subject.land(nil)}.to raise_error
        "pass in plane objects only"
  end
end
