require 'airport'
describe Airport do

  describe "#dealing with full airport" do

    it "should respond to full? method" do
      expect(subject).to respond_to :full?
    end

  end

  describe "#take off and landing of planes" do

    it "should respond to accept_plane method" do
      expect(subject).to respond_to :accept_plane
    end

    it "should respond to plane_take_off method" do
      expect(subject).to respond_to :plane_take_off
    end

    it "if airport is full, not allow planes to land" do
      # set full? to return true
      expect { subject.accept_plane }.to raise_error("Airport full -> can't accept planes!")
    end

  end

  describe "#capacity" do

    let(:subject) { Airport.new(5) }

    it "when airport object is being instantiated, should accept an argument of capacity" do
      expect(subject.capacity).to eq 5
    end

  end
  
  # describe "#weather" do
  #
  #   it "should respond_to to the method stormy?" do
  #     expect(subject).to respond_to :stormy?
  #   end
  #
  #   it "the stormy? method should return a boolean" do
  #     expect(subject.stormy?.class).to eq(Boolean)
  #   end
  #
  # end

end
