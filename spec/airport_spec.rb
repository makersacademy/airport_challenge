require 'airport'

describe Airport do
  let(:plane) { double :plane }
  
  describe "#land" do
    subject.land(plane)
    expect(subject.show_planes).to include plane
  end
end