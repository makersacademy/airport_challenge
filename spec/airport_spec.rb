require "airport"

describe Airport do
  let(:subject) { Airport.new }

  it "is an instance of a Airport" do
    expect(subject).to be_a(Airport)
  end

  it " has passengers" do
    expect(subject.passengers).to be_a(Array)
  end

  it "has a place for planes to land" do
    expect(subject.landed_planes).to be_a(Array)
  end
end
