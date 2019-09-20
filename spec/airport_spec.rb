require "airport"

describe Airport do

  it "responds to land" do
    expect(subject).to respond_to :land
  end

  it "lands a plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
