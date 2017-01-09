require 'airport'



describe Airport do
  plane = Plane.new

  describe "#initialize" do
    it "default capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect {subject.land(plane)}.to raise_error "The airport is full"
      end
  end
it "has a default capacity of" do
  expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
end




  describe "#landing" do
    Plane.new
    it {is_expected.to respond_to(:land).with(1).argument}
  end



describe "#take_off" do
it  {is_expected.to respond_to(:leave).with(1).argument}
end
end
