require 'plane'

describe Plane do
  let(:airplane) { Plane.new }
  it "can read a flying status" do
    expect(airplane).to respond_to :flying
  end

  it "can set a flying status" do
    expect(airplane).to respond_to :flying=
  end
end
