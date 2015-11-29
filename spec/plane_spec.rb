require 'plane'

describe Plane do

  let(:airport) {double(:airport,
                :name => "JFK",
                :planes => [])}

  let(:traffic_control) {double(:traffic_control,
                :approve_landing? => true,
                :approve_takeoff? => true)}

  context '<><> Plane state <><>' do
    it 'returns false if plane is not flying' do
      subject.land(traffic_control, airport)
      expect(subject.is_flying).to eq false
    end

    it 'returns true if plane is flying' do
      subject.land(traffic_control, airport)
      subject.take_off(traffic_control, airport)
      expect(subject.is_flying).to eq true
    end
  end

  context '<><> Landing <><>' do
    it 'can land at an airport' do
      subject.land(traffic_control, airport)
      expect(airport.planes.include?(subject)).to eq true
    end

    it 'prevents second landing' do
      subject.land(traffic_control, airport)
      expect{subject.land(traffic_control, airport)}.to raise_error "This plane is already landed!"
    end
  end

  context '<><> Take off <><>' do
    it 'can take off from an airport' do
      subject.land(traffic_control, airport)
      subject.take_off(traffic_control, airport)
      expect(airport.planes.include?(subject)).to eq false
    end

    it 'prevents second take off' do
      subject.land(traffic_control, airport)
      subject.take_off(traffic_control, airport)
      expect{subject.take_off(traffic_control, airport)}.to raise_error "This plane is already flying!"
    end

    it 'should prevent take off if plane is not at the airport' do
      airport2 = double(:airport, :name => "BOMBAY", :planes => [])
      subject.land(traffic_control, airport)
      expect{subject.take_off(traffic_control, airport2)}.to raise_error "This plane is not at #{airport2.name}!"
    end
  end

end
