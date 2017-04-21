require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Airport do

  subject(:airport) {Airport.new}
  it { should respond_to(:land) }
  it { should respond_to(:takeoff) }

   context "#land" do
     it 'Lands the plane at the airport' do
       plane = Plane.new
       allow(subject).to receive(:safety_weather?) { false }
       allow(subject).to receive(:full?) { false }
       expect(subject.land).to eq "Plane landed at the airport"
     end

    it 'raises an error if airport is full' do
      allow(subject).to receive(:plane) { :airport_max_capacity }
      allow(subject).to receive(:weather_unsafe?) { false }
      allow(subject).to receive(:full?) { true }
      expect { subject.land }.to raise_error("The airport is at maximum capacity")
    end

    it 'raises error if #land cancel due to stormy weather' do
      allow(subject).to receive(:plane) { :stormy_weather }
      allow(subject).to receive(:weather_unsafe?) { true }
      allow(subject).to receive(:full?) { false }
      expect { subject.land }.to raise_error "The flight is canceled due to stormy weather"
    end
  end

  context 'takeoff' do
     it "departs a plane from the airport" do
       allow(subject).to receive(:plane) { :takeoff_plane_cofirmation }
       allow(subject).to receive(:stormy_wether?) { false }
       allow(subject).to receive(:full?) { true }
       expect(airport.takeoff).to eq "Plane departed from the aeroport!"
  end

    it 'raises error if #takeoff cancel due to stormy weather' do
      allow(subject).to receive(:plane) { :stormy_weather }
      allow(subject).to receive(:weather_unsafe?) { true }
      allow(subject).to receive(:empty?) { false }
      expect { subject.takeoff }.to raise_error "The flight is canceled due to stormy weather"
    end

  end
end
