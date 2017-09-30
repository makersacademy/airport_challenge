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

end
