require 'plane'
require 'weather'

describe Plane do
  subject(:plane) {described_class.new}

  let(:airport) {double(:airport, full: false, stormy: false, planes: [])}
  let(:full_airport) {double(:airport, full: true, stormy: false, planes: [])}
  let(:airport_with_storm) {double(:airport, full: false, stormy: true, planes: [])}

  describe "#land" do

    it "should be able to land" do
      subject.land(airport)
      expect(subject.landed?).to eq true
    end

    it "shouldnt land when landed" do
      subject.land(airport)
      expect{subject.land(airport)}.to raise_error "Sir, we're already here!"
    end

    it "cannot land when airport is full" do
      expect{(Plane.new).land(full_airport)}.to raise_error "This is niner-niner-three - airport is full - we can't land!"
    end

    it "fails in stormy weather" do
      expect{subject.land(airport_with_storm)}.to raise_error "MAYDAY! this is niner-niner-three - we can't land in this storm!"
    end

    it "should take-off then land and know it is landed" do
      subject.land(airport)
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.landed).to eq true
    end

    it "should be in the airport array when landed" do
      subject.land(airport)
      expect(airport.planes).to eq [subject]
    end

  end

  describe "#take_off" do

    it { is_expected.to respond_to :take_off}

    it "should know it is not landed" do
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.landed?).to eq false
    end

    it "should remove plane from planes" do
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end

    it "fails when weather is stormy" do
      airport = double(:airport, full: false, stormy: false, planes: [])
      subject.land(airport)
      allow(airport).to receive_messages(stormy: true, planes: [subject])
      expect{subject.take_off(airport)}.to raise_error "This is niner-niner-three - we can't take off in this storm!"
    end

    it "can't take off from the wrong airport" do
      random_airport = double(:airport, full: false, stormy: false, planes: [])
      subject.land(airport)
      expect{subject.take_off(random_airport)}.to raise_error "Sir, are you crazy? This plane isn't at that airport!"
    end

    it "cannot take off if already airborne" do
      subject.land(airport)
      subject.take_off(airport)
      expect{subject.take_off(airport)}.to raise_error "Sir, are you crazy? We're already airborne!"
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
      expect(airport.planes).not_to include plane
    end
  end

end
