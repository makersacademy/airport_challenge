require 'plane'

describe Plane do

  it "creates a new instance of a plane when a plane lands" do
    expect(Plane.new).to respond_to :landed?
    #it { is_expected.to respond_to :landed? }
  end

it "creates a new instance of a plane when a plane takes off" do
  expect(Plane.new).to respond_to :taken_off?
  #it { is_expected.to respond_to :taken_off }
end

end
