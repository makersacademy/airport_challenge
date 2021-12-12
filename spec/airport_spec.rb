require 'airport'

describe Airport do
  it "allows a plane to land" do
    expect(subject).to respond_to :land
  end

  it "allows a plane to takeoff" do
    expect(subject).to respond_to :takeoff
  end
end
