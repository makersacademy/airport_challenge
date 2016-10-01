require 'plane'

describe Plane do
  it {is_expected.to respond_to :landed? }

  describe "initialization" do
    it "landed should nil when new" do
      expect(subject.landed?).to be nil
    end
  end

  let(:airport) { double(:airport, add: subject) }

  describe "#add_to_airport" do
    it "should raise an error when the plane is not new" do
      plane = described_class.new.send(:set_as_landed)
      expect {subject.add_to(airport)}.to raise_error "Plane is not new!"
    end
    before { subject.add_to(airport) }
    it "should set the airport where plane is landed" do
      expect(subject.airport).to eq airport
    end
    it "should set landed attribute to true" do
      expect(subject.landed?).to be true
    end
  end
end
