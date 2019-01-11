require "airport"

describe Airport do
  it "Has a method to allow user to land plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end
end
