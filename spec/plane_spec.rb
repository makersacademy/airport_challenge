require 'plane'

describe Plane do
  it "position method should respond when called by plane instance" do
    expect(subject).to(respond_to(:position))
  end
  it "change_position method changes plane's position from air to ground" do
    subject.change_position
    expect(subject.position).to(eq("ground"))
  end
end
