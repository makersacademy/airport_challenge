require 'airport'

describe Airport do

  let(:plane) { double(:plane, :passengers => []) }
  
  it "can store planes" do
    subject.planes << plane
    expect(subject.planes).to include(plane)
  end

end
