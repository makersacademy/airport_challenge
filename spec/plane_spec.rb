require 'plane'

describe Plane do
  it "position method should return air when flying" do
    expect(subject.position).to(eq(:air))
  end
end
