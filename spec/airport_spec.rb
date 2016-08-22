require 'airport'
require 'plane'

describe Airport do
  before do
    subject() { described_class.new }
  end

  describe "#prevent_take_off" do
    it "raises an error when the weather is bad to take off" do
      message = "Take-off not permitted due to stormy weather. Await for further instructions!"
      expect { subject.prevent_take_off }.to raise_error message
    end

    it "raises an error when there is no plane at the airport to take off" do
      expect { subject.prevent_take_off }.to raise_error "Error! No plane to take-off!"
    end
  end

  describe "#prevent_landing" do
    it "raises an error when the weather is bad for landing" do
      message = "Landing not permitted due to stormy weather. Await for further instructions!"
      expect { subject.prevent_landing(Plane.new) }.to raise_error message
    end

    it "raises an error when the airport is full and no further plane can land" do
      subject = Airport.new(0)
      message = "Landing not permitted - airport full. Await for further instructions!"
      expect { subject.prevent_landing(Plane.new) }.to raise_error message
    end
  end
end
