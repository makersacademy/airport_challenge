require 'plane'

describe Plane do
  it "position method should respond when called by plane instance" do
    expect(subject).to(respond_to(:position))
  end
end
