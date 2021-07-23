require_relative  "../airport.rb"


describe Airport do
  it "instructs a plane to land at an airport" do
    expect(subject.land("plane1")). to eq ["plane1"]
  end
end