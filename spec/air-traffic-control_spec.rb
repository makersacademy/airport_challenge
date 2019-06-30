require 'air-traffic-control'

describe AirTrafficControl do

  let(:weather) { instance_double('Weather') }
  let(:airport_ops) { instance_double('Airport') }
  let(:airbusA380) { instance_double('Airplane') }

  before :each do 
    subject.get_weather_status(weather)
    allow(airport_ops).to receive(:store) { "calls Airport.store" }
    allow(airport_ops).to receive(:release) { "calls Airport.release" }
    subject.connect_with_airside_ops(airport_ops)
    allow(airbusA380).to receive(:has_landed) { "calls Airplane.has_landed" }
    allow(airbusA380).to receive(:is_flying) { "calls Airplane.is_flying" }
  end

  describe "#check_for_storms" do
    it "to see if the weather is stormy" do
      allow(weather).to receive_messages(:stormy? => true)
      expect(subject.check_for_storms).to eq(true)
    end
  end

  describe "#pre_land_checks" do

    it "allows a plane to land if all check pass" do
      allow(airbusA380).to receive_messages(:flying? => true)
      allow(weather).to receive_messages(:stormy? => false)
      allow(airport_ops).to receive_messages(:hangar_at_capacity? => false)
      expect(subject.pre_land_checks(airbusA380)).to eq(airbusA380.has_landed)
    end

    it "does not allow planes to takeoff during stormy weather" do
      allow(airbusA380).to receive_messages(:flying? => true)
      allow(weather).to receive_messages(:stormy? => true)
      expect(subject.pre_land_checks(airbusA380)).to eq("Planes are prohibited to land due to adverse weather conditions")
    end

    it "does not allow planes to land when the hangar is full at default 10" do
      allow(airbusA380).to receive_messages(:flying? => true)
      allow(weather).to receive_messages(:stormy? => false)
      allow(airport_ops).to receive_messages(:hangar_at_capacity? => true)
      expect(subject.pre_land_checks(airbusA380)).to eq("Planes are prohibited to land due to hangar at max. capacity")
    end

    context "when a plane is flying" do
      it "it allows the plane to land" do
        allow(airbusA380).to receive_messages(:flying? => true)
        allow(weather).to receive_messages(:stormy? => false)
        allow(airport_ops).to receive_messages(:hangar_at_capacity? => false)
        expect(subject.pre_land_checks(airbusA380)).to eq(airbusA380.has_landed)
      end
    end

    context "when a plane isn't flying" do
      it "the plane cannot land" do
        allow(airbusA380).to receive_messages(:flying? => false)
        expect(subject.pre_land_checks(airbusA380)).to eq "the plane is not airborne"
      end
    end
  end
    
  describe "#pre_take_off_checks" do

    it "allows the plane to takeoff if all checks pass" do
      allow(airport_ops).to receive_messages(:plane_stored? => true)
      allow(weather).to receive_messages(:stormy? => false)
      allow(airbusA380).to receive_messages(:flying? => false)
      expect(subject.pre_take_off_checks(airbusA380)).to eq(airbusA380.is_flying)
    end

    it "does not allow plane to takeoff if not in hangar" do
      allow(airport_ops).to receive_messages(:plane_stored? => false)
      expect(subject.pre_take_off_checks(airbusA380)).to eq("Plane is not stored at this airport")
    end

    it "does not allow the plane to takeoff during stormy weather" do
      allow(airport_ops).to receive_messages(:plane_stored? => true)
      allow(weather).to receive_messages(:stormy? => true)
      allow(airbusA380).to receive_messages(:flying? => false)
      expect(subject.pre_take_off_checks(airbusA380)).to eq("Planes are grounded due to adverse weather conditions")
    end
  end
end
