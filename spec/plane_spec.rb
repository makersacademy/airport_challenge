require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }

  it "check if the plane is landed" do
    expect(plane.landed?).to eq true
  end

end
