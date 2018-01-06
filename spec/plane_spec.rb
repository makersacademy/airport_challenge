require_relative "../lib/plane"

describe Plane do 

  it "should respond to land instruction" do
    expect(subject).to respond_to?(:land)
  end

end
