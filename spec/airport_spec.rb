require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  let(:plane) do
    double :plane, land: :landed, take_off: :flying # not sure
  end

  it { is_expected.to respond_to(:clear_for_landing).with(1).argument }
  it { is_expected.to respond_to(:clear_for_takeoff).with(1).argument }
  it { is_expected.to respond_to(:weather_report) }
  # I don't need to test content of :weather_report
  # because it's been tested in the weather class?
  describe "#capacity" do
    it "returns capacity of airport" do
      expect(Airport.new(67).capacity).to eq(67)
    end
  end
  describe "#clear_for_takeoff" do
    it "instructs a specific plane to take off" do
      # find a way to prevent repetition
      allow(subject).to receive(:weather_report) { :sunny }
      subject.clear_for_landing(plane)
      subject.clear_for_landing(double :plane_2, land: :landed, take_off: :flying)
      expect(subject.clear_for_takeoff(plane)).to eq(plane)
    end
    it "changes plane status to :flying" do # not sure
      allow(subject).to receive(:weather_report) { :sunny }
      my_plane = subject.clear_for_landing(plane).pop
      allow(my_plane).to receive(:plane_status) { :flying }
      expect(my_plane.plane_status).to eq(:flying)
    end
  end
  context "when the weather is stormy" do
    describe "#clear_for_landing(plane)" do
      it "cannot accept planes when weather is stormy" do
        allow(subject).to receive(:weather_report) { :stormy }
        expect{ subject.clear_for_landing(plane) == :stormy }.
          to raise_error('Too stormy')
      end
    end
  end
  context "when the weather is sunny" do
    context "when full" do
      describe "#clear_for_landing(plane)" do
        it "cannot accept planes more than its capacity" do
          allow(subject).to receive(:weather_report) { :sunny }
          50.times { subject.clear_for_landing(plane) }
          expect { subject.clear_for_landing(plane) }.
            to raise_error('Airport full')
        end
      end
    end
    context "when not full" do
      describe "#clear_for_landing(plane)" do
        it "accepts a plane" do
          allow(subject).to receive(:weather_report) { :sunny }
          my_plane = subject.clear_for_landing(plane).last
          expect(my_plane).to eq(plane)
        end
        it "changes plane status to :landed" do # not sure
          allow(subject).to receive(:weather_report) { :sunny }
          my_plane = subject.clear_for_landing(plane).last
          allow(my_plane).to receive(:plane_status) { :landed }
          expect(my_plane.plane_status).to eq(:landed)
        end
      end
    end
  end

  # it "can get weather report" do
  #   weather = class_double('Weather')
  #   allow(weather).to receive(:new)
  #   allow(weather.new).to receive(:weather_report) { :sunny }
  #   expect(subject.get_weather_report).to receive (weather.new.weather_report)
  # end
end











#
# describe Airport do
#
#   describe 'take off' do
#     xit 'instructs a plane to take off'
#
#     xit 'releases a plane'
#   end
#
#   describe 'landing' do
#     xit 'instructs a plane to land'
#
#     xit 'receives a plane'
#   end
#
#   describe 'traffic control' do
#     context 'when airport is full' do
#       xit 'does not allow a plane to land'
#     end
#
#     # Include a weather condition.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport
#
#     context 'when weather conditions are stormy' do
#       xit 'does not allow a plane to take off'
#
#       xit 'does not allow a plane to land'
#     end
#   end
# end
