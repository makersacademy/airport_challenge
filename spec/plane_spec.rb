require "plane"

describe "Plane" do

  it "comfirms landing at the airport" do
    subject = Plane.new
    subject.landed?
    expect(subject.landed?).to eq true
  end

end
