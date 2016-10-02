require 'plane'

describe Plane do
  let(:airport) {double(:airport, :full=>false, :stormy_weather=>false, :landed_planes=>[])}

  it "should confirm it is landed" do
    expect(subject.landed?).to eq true
  end

  it { is_expected.to respond_to :land }

  describe "#land" do

    it "should land at an airport" do
      subject.land(airport)
    end

    it "should know it is landed at an airport" do
      subject.land(airport)
      expect(subject.landed?).to eq true
    end

    it "fails at full airport" do
      airport = double(:airport, :full=>true, :stormy_weather=>false, :landed_planes=>[])
      expect{(Plane.new).land(airport)}.to raise_error "Airport is full"
    end

    it "fails in stormy weather" do
      airport = double(:airport, :full=>false, :stormy_weather=>true, :landed_planes=>[])
      expect{subject.land(airport)}.to raise_error "Plane can't land when weather is stormy"
    end

    it "should take-off then land and know it is landed" do
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.landed).to eq true
    end

  end

  describe "#take_off" do
    before(:each) do
      @airport = Airport.new
    end
    it { is_expected.to respond_to :take_off}

    it "should confirm it is not landed" do
      subject.take_off(@airport)
      expect(subject.landed?).to eq false
    end

    it "fails when weather is stormy" do
      @airport.stormy_weather=(true)
      expect{subject.take_off(@airport)}.to raise_error "Plane can't take-off when weather is stormy"
    end


  end

end
