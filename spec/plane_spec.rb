require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  let(:airport) {double(:airport, :full=>false, :stormy_weather=>false, :landed_planes=>[])}
  let(:full_airport) {double(:airport, :full=>true, :stormy_weather=>false, :landed_planes=>[])}
  let(:stormy_airport) {double(:airport, :full=>false, :stormy_weather=>true, :landed_planes=>[])}
  
  describe "#land" do

    it "should know it is landed at an airport" do
      subject.land(airport)
      expect(subject.landed?).to eq true
    end

    it "fails when already landed" do
      subject.land(airport)
      error = "Plane already landed at an airport"
      expect{subject.land(airport)}.to raise_error error
    end

    it "fails at full airport" do
      error = "Airport is full"
      expect{(Plane.new).land(full_airport)}.to raise_error error
    end

    it "fails in stormy weather" do
      error =  "Plane can't land when weather is stormy"
      expect{subject.land(stormy_airport)}.to raise_error error
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
      error = "Plane can't take-off when weather is stormy"
      expect{subject.take_off(airport)}.to raise_error error
    end

    it "fails if told to take off from a different airport" do
      random_airport = double(:airport, :full=>false, :stormy_weather=>false, :landed_planes=>[])
      subject.land(airport)
      error =  "Plane not landed at that airport"
      expect{subject.take_off(random_airport)}.to raise_error error
    end

    it "should not take off if already in the air" do
      subject.land(airport)
      subject.take_off(airport)
      error = "Plane cannot take-off when already in the air"
      expect{subject.take_off(airport)}.to raise_error error
    end

    it "takes off a specific plane" do
      specific_plane = Plane.new
      10.times do
        (Plane.new).land(airport)
      end
      specific_plane.land(airport)
      10.times do
        (Plane.new).land(airport)
      end
      specific_plane.take_off(airport)
      expect(airport.landed_planes).not_to include plane
    end
  end

end
