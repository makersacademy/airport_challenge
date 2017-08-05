require 'plane'
require 'airport'
describe Plane do

  describe "when landing" do
    context "from the sky" do
      subject(:plane) { described_class.new }
      it "status changes to on the ground" do
        airport = double("airport", :planes => 50, :capacity => 100)
        airport.stub(:get_weather => :sunny, :receive_plane => :planes )
        subject.land(airport)
        expect(subject.status).to eq :on_the_ground
      end
      it "does not land into a full airport" do
        airport5 = double("airport5", :planes => 100, :capacity => 100)
        airport5.stub(:get_weather => :sunny)
        subject.land(airport5)
        expect(subject.status).to eq :in_the_air
      end
      it "does not land into a stormy airport" do
        airport4 = double("airport4")
        airport4.stub(:get_weather => :stormy)
        subject.land(airport4)
        expect(subject.status).to eq :in_the_air
      end
    end
    context "while already grounded" do
      let(:airport) { double("airport", :planes => 50) }
      it "raises an error if trying to land at same airport" do
        airport.stub(:get_weather => :sunny)
        plane7 = Plane.new(airport)
        expect{plane7.land(airport)}.to raise_error("already landed at this airport")
      end
      it "raises an error if trying to land at another airport" do
        airport.stub(:get_weather => :sunny)
        airport9 = double("airport9", :planes => 50)
        airport9.stub(:get_weather => :sunny)
        plane8 = Plane.new(airport)
        expect{plane8.land(airport9)}.to raise_error("already landed at another airport")
      end
    end
  end

  describe "when taking off" do
    let(:airport) { double("airport")}
    it "status changes to in the air" do
      airport.stub(:get_weather => :sunny, :remove_plane => :planes)
      plane2 = Plane.new(airport)
      plane2.take_off(airport)
      expect(plane2.status).to eq :in_the_air
    end
    it "raises an error if already flying" do
      airport.stub(:get_weather => :sunny)
      plane6 = Plane.new
      expect{plane6.take_off(airport)}.to raise_error("already flying")
    end
    it "does not take off from a stormy airport" do
      airport.stub(:get_weather => :stormy)
      plane3 = Plane.new(airport)
      plane3.take_off(airport)
      expect(plane3.status).to eq :on_the_ground
    end
  end

end
