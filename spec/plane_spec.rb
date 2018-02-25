require 'plane'

describe Plane do
  
  let(:dummy_airport_stansted) { double :dummy_airport, hangar: [] } 
  let(:dummy_airport_heathrow) { double :dummy_airport, hangar: [] } 

  describe ':initialize' do

    it "planes should initialize in an airport hangar" do
      Plane.new(dummy_airport_stansted) 
      expect(dummy_airport_stansted.hangar.length).to eq(1)
    end

  end

  describe ':take_off_check' do

    it "if plane has no approval error should be raised" do
      plane = Plane.new(dummy_airport_stansted)
      expect { plane.take_off_check }.to raise_error(RuntimeError)
    end

  end

  describe ':take_off' do

    it "plane should remove itself from their airports hangar" do
      plane = Plane.new(dummy_airport_stansted)
      plane.take_off
      expect(dummy_airport_stansted.hangar.length).to eq(0)
    end

  end

  describe ':landing_check' do

    it "if plane has no approval error should be raised" do
      plane = Plane.new(dummy_airport_stansted)
      plane.take_off
      expect { plane.landing_check }.to raise_error(RuntimeError)
    end
  end

  describe ':land' do

    it "plane should land in an airports hangar" do
      plane = Plane.new(dummy_airport_stansted)
      plane.take_off
      plane.land(dummy_airport_heathrow)
      expect(dummy_airport_heathrow.hangar.length).to eq(1)
    end

  end

end
