require 'airport'

describe Airport do

  it "responds to the full? method" do
    expect(subject).to respond_to(:full?)
  end

  context "when initializing an airport" do

    it "is initialized with a default plane capacity" do
      expect(subject.capacity).to eq(20)
    end

    it "can have its plane capacity overridden" do
      # airport = Airport.new(15)
      expect(described_class.new(15).capacity).to eq(15)
    end
  end
end
