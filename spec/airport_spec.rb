require 'airport'
require 'plane'

describe Airport do
  before do
    subject() { described_class.new }
#    subject.set_weather("stormy")
  end

  describe "#prevent_take_off" do
    it "raises an error when the weather is bad to take off" do
      expect { subject.prevent_take_off }.to raise_error "Take-off not permitted due to stormy weather. Await for further instructions!"
    end

    it "raises an error when there is no plane at the airport to take off" do
#      subject.set_weather("sunny")
      expect { subject.prevent_take_off }.to raise_error "Error! No plane to take-off!"
    end
  end

  describe "#prevent_landing" do
    it "raises an error when the weather is bad for landing" do
      expect { subject.prevent_landing(Plane.new) }.to raise_error "Landing not permitted due to stormy weather. Await for further instructions!"
    end

    it "raises an error when the airport is full and no further plane can land" do
      subject = Airport.new(0)
      expect { subject.prevent_landing(Plane.new) }.to raise_error "Landing not permitted - airport full. Await for further instructions!"
    end
end


end
