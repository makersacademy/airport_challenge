require 'plane'

describe Plane do

  it "creates a new instance of a plane when a plane lands" do
    expect(Plane.new).to respond_to :landed?
    #it { is_expected.to respond_to :landed? }
  end

end
