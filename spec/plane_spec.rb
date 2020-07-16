require 'plane'

RSpec.describe Plane do
  let(:airport) { double(
    :airport,
    :planes => [],
    :stormy => false,
    :full? => false)
  }

  it "can hold passengers" do
    expect(subject.passengers).to be_instance_of(Array)
  end

  context "when not stormy" do
    it "can land" do
      # allow(airport).to receive(:full?) { false }
      subject.land(airport)
      expect(subject).to be_parked_in(airport)
    end

    it "can take_off" do
      allow(airport).to receive(:confirm_departure)
      subject.land(airport)
      subject.take_off(airport)
      expect(subject).not_to be_parked_in(airport)
    end

  end

  context "when stormy" do
    let(:airport) { double(
      :airport,
      :planes => [],
      :stormy => true,
      :full? => false)
    }

    it "cannot land" do
      subject.land(airport)
      expect(subject).not_to be_parked_in(airport)
    end

    it "cannot take_off" do
      airport.planes << subject
      subject.take_off(airport)
      expect(subject).to be_parked_in(airport)
    end
  end

  context "edge cases" do
    let(:airport2) { double(
      :airport,
      :planes => [],
      :stormy => false,
      :full? => false)
    }
    let(:full_airport) { double(
      :airport,
      :planes => [],
      :stormy => false,
      :full? => true)
    }

    it "cannot land when already in airport" do
      2.times { subject.land(airport) }
      expect(airport.planes).to eq([subject])
    end

    it "cannot take_off when not landed" do
      expect(subject.take_off(airport)).to eq("#{subject} not at this airport")
    end

    it "cannot take_off from airport it's not in" do
      subject.land(airport2)
      expect(subject).to be_parked_in(airport2)
      expect(subject.take_off(airport)).to eq("#{subject} not at this airport")
    end

    it "cannot land in a full airport" do
      subject.land(full_airport)
      expect(full_airport.planes).not_to include(subject)
    end

  end
end
