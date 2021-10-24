require './../lib/plane.rb'

describe Plane do

  it "gives us a friendly message" do
    expect(subject.land("JFK")).to eq "Landed at JFK"
  end

end