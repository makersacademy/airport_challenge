require "airport"
require "plane"
require "weather"

=begin
describe Airport do
  it { is_expected.to respond_to(:request_to_land) }
  it { is_expected.to respond_to(:take_off) }

  it "Checks to see if airport capacity is default" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  # check if you can have a different capacity

  describe "#take_off" do
    it "Confirms a plane as left the airport" do
      expect { subject.take_off }.to output("The plane has departed\n").to_stdout
    end
  end

  describe "#land" do
    it "checks that planes cannot land if airport is at capacity" do
      Airport::DEFAULT_CAPACITY.times do
        subject.land Plane.new
      end
      expect { subject.land Plane.new }.to raise_error "The airport is at capacity"
    end
  end
end


=end
