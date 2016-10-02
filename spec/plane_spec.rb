require 'plane'

describe Plane do
  let(:airport) {double(:airport, :full=>false, :stormy_weather=>false, :landed_planes=>[])}
  let(:full_airport) {double(:airport, :full=>true, :stormy_weather=>false, :landed_planes=>[])}
  let(:stormy_airport) {double(:airport, :full=>false, :stormy_weather=>true, :landed_planes=>[])}

  it { is_expected.to respond_to :landed? }

  it { is_expected.to respond_to :land }

  describe "#land" do

    it "should land at an airport" do
      subject.land(airport)
    end

    it "should know it is landed at an airport" do
      subject.land(airport)
      expect(subject.landed?).to eq true
    end

    it "fails when already landed" do
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error "Plane already landed at an airport"
    end

    it "fails at full airport" do
      expect{(Plane.new).land(full_airport)}.to raise_error "Airport is full"
    end

    it "fails in stormy weather" do
      expect{subject.land(stormy_airport)}.to raise_error "Plane can't land when weather is stormy"
    end

    it "should take-off then land and know it is landed" do
      subject.land(airport)
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.landed).to eq true
    end

    it "should be in the airport array when landed" do
      subject.land(airport)
      expect(airport.landed_planes).to eq [subject]
    end

  end

  describe "#take_off" do

    it { is_expected.to respond_to :take_off}

    it "should know it is not landed" do
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.landed?).to eq false
    end

    it "should remove plane from landed_planes" do
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.landed_planes).to eq []
    end

    it "fails when weather is stormy" do
      airport = double(:airport, :full=>false, :stormy_weather=>false, :landed_planes=>[])
      subject.land(airport)
      allow(airport).to receive_messages(
        :stormy_weather => true,
        :landed_planes => [subject])
      expect{subject.take_off(airport)}.to raise_error "Plane can't take-off when weather is stormy"
    end

    it "should only take off from an airport it is at" do
      random_airport = Airport.new
      subject.land(airport)
      expect{subject.take_off(random_airport)}.to raise_error "Plane not landed at that airport"
    end

    it "should only take off if already in the air" do
      subject.land(airport)
      subject.take_off(airport)
      expect{subject.take_off(airport)}.to raise_error "Plane cannot take-off when already in the air"
    end

  end

end
