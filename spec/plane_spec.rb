require 'plane'

describe Plane do
  it "should confirm it is landed" do
    expect(subject.landed?).to eq true
  end

  it { is_expected.to respond_to :land }

  describe "#land" do
    before(:each) do
      @airport = Airport.new
    end

    it "should land at an airport" do
      subject.land(@airport)
    end

    it "should know it is landed at an airport" do
      subject.land(@airport)
      expect(subject.landed?).to eq true
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

  end

end
