require "airport"

describe Airport do

  before :each do
    @plane = double(:plane)
  end

  context "land plane" do

    describe "#land" do
      it "instructs the plane to land" do
        # expects plane to have its land method called
        expect(@plane).to receive(:land)
        # call the airport.land(@plane) to call plane.land
        subject.land @plane
      end
    end

    describe "#land" do
      it "has the plane after it has landed" do
        allow(@plane).to receive(:land)
        subject.land @plane
        expect(subject.planes).to include @plane
      end
    end

  end

  it "instruct plane to take off" do
    expect(@plane).to receive(:take_off)
    subject.take_off(@plane)
  end

  it "doesn't have the plane after take-off" do
    allow(@plane).to receive(:take_off)
    subject.planes << @plane
    subject.take_off(@plane)
    expect(subject.planes).not_to include @plane
  end

end
