require "airport"

describe "Airport" do

  it "receives a plane" do
    subject = Airport.new
    subject.receive_plane
    expect(subject.receive_plane)
  end

end
