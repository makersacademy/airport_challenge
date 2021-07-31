require "airport"

describe Airport do  
  it "has room for planes to land" do
    expect(subject.hanger).to eq []
  end

  it "can accept a plane to #land" do
    expect(subject).to respond_to :land
  end

  it "accepts 1 plane argument when landing" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "fails to land when no plane is given" do
    expect { subject.land() }.to raise_error(ArgumentError)
  end
end
