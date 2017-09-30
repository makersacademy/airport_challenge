require 'airport'

describe Airport do
  it "lands planes" do
      plane = double
      subject.land(plane)
      expect(subject.planes[0]).to eq(plane)
    end
end
