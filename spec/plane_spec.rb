require 'plane'

describe Plane do
  subject { Plane.new(double("airport")) }

  let(:fakeport) { double("Airport") }

  it { is_expected.to respond_to(:flying?, :land, :take_off, :current_airport) }

  it "requires an airport at creation" do
    expect(subject.current_airport).not_to eq nil
  end

  it "is landed at creation" do
    expect(subject).to_not be_flying
  end

  describe "#take off" do
    
    it "sets plane flying" do
      subject.take_off(fakeport)
      expect(subject).to be_flying
    end

    it "removes any current airport data" do
      subject.take_off(fakeport)
      expect(subject.current_airport).to eq nil
    end

  end

  describe '#land' do

    it "stops plane from flying" do
      subject.take_off(fakeport)
      subject.land(fakeport)
      expect(subject).not_to be_flying
    end

    it "records the aiport it lands at" do
      subject.take_off(fakeport)
      subject.land(fakeport)
      expect(subject.current_airport).to eq fakeport
    end

  end
end