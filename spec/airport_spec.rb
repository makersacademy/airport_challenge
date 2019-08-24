require_relative "../lib/airport"

describe Airport do
  it "receives a plane" do
    expect(subject).to respond_to(:receive_plane).with(1).argument
  end
end
