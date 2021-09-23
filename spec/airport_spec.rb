describe Airport do
  let(:plane) { double(:plane) }

  describe "#land" do
    subject.land(plane)
    expect(subject.planes).to include plane
  end
end