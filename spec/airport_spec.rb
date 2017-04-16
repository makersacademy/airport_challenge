require './lib/airport'
require './lib/plane'
require './lib/weather'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  context "#land and #takeoff" do

    it "created a plane and adds it to landed planes" do

      subject.land(plane)
      expect(subject.landed_planes).to include plane
    end


    it 'removes plane from landed planes' do
      subject.takeoff(plane)
      expect(subject.landed_planes).to_not include plane
    end

    it "prevents take off when stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      subject.land(plane)
      expect { subject.takeoff(plane) }.to raise_error "Too stormy for takeoff!"

    end
  end
end
