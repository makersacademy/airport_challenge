require './lib/airport'

describe Airport do
  
  it "verifies Airport exists" do
    expect(subject).to be_a(Object)
  end

  it "instructs a plane to land" do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane.landed?)
  end

end
