require 'plane'

describe Plane do
  let(:fakeport) { double("Airport") }
  let(:fakeport2) { double("Airport 2") }

  subject { Plane.new(fakeport) }

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

    it "raises an error if trying to take off from different airport" do
      expect { subject.take_off(fakeport2) }.to raise_error(
        "Take off from wrong airport, abort."
      )
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
