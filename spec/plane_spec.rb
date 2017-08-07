require 'plane'
require 'airport'
describe Plane do

  describe "when landing" do
    context "from the sky" do
      subject(:plane) { described_class.new }
      let(:airport) { double("airport")}
      it "status changes to on the ground" do
        airport.stub(:get_weather => :sunny, :receive_plane => :planes, :full? => false )
        subject.land(airport)
        expect(subject.status).to eq :on_the_ground
      end
      it "raises an error if trying to land into a full airport" do
        airport.stub(:get_weather => :sunny, :full? => true)
        expect{subject.land(airport)}.to raise_error("unable to land as airport is full")
      end
      it "raises an error if trying to land into a stormy airport" do
        airport.stub(:get_weather => :stormy)
        expect{subject.land(airport)}.to raise_error("too stormy to land")
      end
    end
    context "while already grounded" do
      let(:airport) { double("airport") }
      subject(:plane) { described_class.new (airport)}

      it "raises an error if trying to land at same airport" do
        airport.stub(:get_weather => :sunny, :full? => false)
        expect{plane.land(airport)}.to raise_error("already landed at this airport")
      end
      it "raises an error if trying to land at another airport" do
        airport.stub(:get_weather => :sunny)
        other_airport = double("other_airport")
        other_airport.stub(:get_weather => :sunny, :full? => false)
        expect{plane.land(other_airport)}.to raise_error("already landed at another airport")
      end
    end
  end

  describe "when taking off" do
    let(:airport) { double("airport")}
    context "from the ground" do
      subject(:plane) { described_class.new (airport)}
      it "status changes to in the air" do
        airport.stub(:get_weather => :sunny, :remove_plane => :planes)
        plane.take_off(airport)
        expect(plane.status).to eq :in_the_air
      end

      it "raises an error if trying to take off from a stormy airport" do
        airport.stub(:get_weather => :stormy)
        expect{plane.take_off(airport)}.to raise_error("too stormy to fly")
      end
    end
    context "from the sky" do
      subject(:plane) { described_class.new}
      it "raises an error if already flying" do
        airport.stub(:get_weather => :sunny)
        expect{plane.take_off(airport)}.to raise_error("already flying")
      end
    end
  end

end
