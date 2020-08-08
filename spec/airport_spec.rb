require "airport"

describe Airport do
  it "Chech if airport is a class" do
    expect(subject).to be_instance_of(Airport)
  end
  it "Airport can store plains" do 
    plain = double("Plane")
    expect(subject.plains).to eq [plain]
  end
end
