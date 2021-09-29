require 'plane'

RSpec.describe Plane do

  it "takes an id" do
    ba101 = Plane.new(:BA101)
    expect(ba101.id).to eq :BA101
  end
end
