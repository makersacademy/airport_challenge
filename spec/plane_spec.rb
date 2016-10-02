require 'plane'

describe Plane do
  it {is_expected.to respond_to :landed? }

  describe "initialization" do
    it "landed? should return nil at creation" do
      expect(subject.landed?).to be nil
    end
  end

  let(:airport) { double :airport }

  describe "#set_airport" do
    before { subject.send(:set_airport, airport) }
    it "should set the airport where plane is landed" do
      expect(subject.airport).to eq airport
    end
    it "should set landed attribute to true" do
      expect(subject.landed?).to be true
    end
  end
end
