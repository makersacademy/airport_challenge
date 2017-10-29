require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it ":landed have a default value false" do
    expect(plane.landed).to eq(false)
  end

  # it "allows reading and writing for :landed" do
  #   plane.landed =true
  #   expect(plane.landed).to eq(true)
  # end

  describe 'change_status'
  it "check if the status of the plane changed after landing" do
    plane.change_status
    expect(plane.landed).to eq(true)
  end

  it "check if the status of the plane changed after take_off" do
    2.times { plane.change_status }
    expect(plane.landed).to eq(false)
  end

end
