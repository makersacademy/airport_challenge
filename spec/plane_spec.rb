require "plane"

describe Plane do

  it "lands" do
    expect(subject).to respond_to :land
  end

  it "takes off" do
    expect(subject).to respond_to :take_off
  end

  it "confirms it has taken off" do
    expect(subject).to respond_to :confirm_take_off
  end

end
