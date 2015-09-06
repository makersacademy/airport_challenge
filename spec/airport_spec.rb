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
  let(:plane) { double :plane, land: :landed, take_off: :flying }
  let(:plane_2) { double :plane_2, land: :landed, take_off: :flying }

  it { is_expected.to respond_to(:clear_for_landing).with(1).argument }
  it { is_expected.to respond_to(:clear_for_takeoff).with(1).argument }
  it { is_expected.to respond_to(:weather_report) }
  it "gets weather report from the weather class" do
    double :Weather, new: :weather, weather_report: :sunny, condition: 0,
      storm_probability: 80
    allow(subject).to receive(:weather_report) { :sunny }
    expect(subject.weather_report).to eq(:sunny)
  end
  describe "#planes" do
    it "returns all the planes at the airport" do
      allow(subject).to receive(:weather_report) { :sunny }
      subject.clear_for_landing(plane)
      expect(subject.planes).to contain_exactly(plane)
    end
  end
  describe "#capacity" do
    it "returns capacity of airport" do
      expect(Airport.new(67).capacity).to eq(67)
    end
  end

  # it "can get weather report" do
  #   weather = class_double('Weather')
  #   allow(weather).to receive(:new)
  #   allow(weather.new).to receive(:weather_report) { :sunny }
  #   expect(subject.get_weather_report).to receive (weather.new.weather_report)
  # end

  context "when the weather is stormy" do
    describe "#clear_for_landing(plane)" do
      it "cannot accept planes" do
        allow(subject).to receive(:weather_report) { :stormy }
        expect{ subject.clear_for_landing(plane) == :stormy }.
          to raise_error('Too stormy')
      end
    end
    describe "#clear_for_takeoff(plane)" do
      it "doesn't allow plane to take off" do
        allow(subject).to receive(:weather_report) { :sunny }
        subject.clear_for_landing(plane)
        allow(subject).to receive(:weather_report) { :stormy }
        expect { subject.clear_for_takeoff(plane) }.
          to raise_error('Too stormy')
      end
    end
  end
  context "when the weather is sunny" do
    context "when it's full" do
      describe "#clear_for_landing(plane)" do
        it "cannot accept planes more than its capacity" do
          allow(subject).to receive(:weather_report) { :sunny }
          50.times { subject.clear_for_landing(plane) }
          expect { subject.clear_for_landing(plane) }.
            to raise_error('Airport full')
        end
      end
    end
    context "when it's empty" do
      describe "#clear_for_takeoff(plane)" do
        it "cannot instruct a plane to take off" do
          allow(subject).to receive(:weather_report) { :sunny }
          expect { subject.clear_for_takeoff(plane) }.
            to raise_error('Airport empty')
        end
      end
    end
    context "when it's not full" do
      describe "#clear_for_landing(plane)" do
        it "accepts a plane" do
          allow(subject).to receive(:weather_report) { :sunny }
          my_plane = subject.clear_for_landing(plane).last
          expect(my_plane).to eq(plane)
        end
        it "changes plane status to :landed" do
          allow(subject).to receive(:weather_report) { :sunny }
          my_plane = subject.clear_for_landing(plane).last
          allow(my_plane).to receive(:plane_status) { :landed }
          expect(my_plane.plane_status).to eq(:landed)
        end
      end
      describe "#clear_for_takeoff(plane)" do
        it "instructs a specific plane to take off" do
          # find a way to prevent repetition
          allow(subject).to receive(:weather_report) { :sunny }
          subject.clear_for_landing(plane)
          subject.clear_for_landing(plane_2)
          expect(subject.clear_for_takeoff(plane)).to eq(plane)
        end
        it "changes plane status to :flying" do
          allow(subject).to receive(:weather_report) { :sunny }
          subject.clear_for_landing(plane)
          allow(plane).to receive(:plane_status) { :flying }
          expect(plane.plane_status).to eq(:flying)
        end
        it "removes the specific plane from airport" do
          allow(subject).to receive(:weather_report) { :sunny }
          subject.clear_for_landing(plane_2)
          subject.clear_for_landing(plane)
          subject.clear_for_takeoff(plane_2)
          expect(subject.planes).to contain_exactly(plane)
        end
      end
    end
  end
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
