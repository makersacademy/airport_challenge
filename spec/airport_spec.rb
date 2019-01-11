require "airport"

describe Airport do
  it "Has a method to allow user to check plane has left airport" do
    expect(subject).to respond_to(:verify_liftoff).with(1).argument
  end
end
