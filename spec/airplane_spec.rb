require "airplane"

describe Airplane do

  context "Class setup" do
    it "tests for an Airplane class" do
      expect(subject.class).to eq(Airplane)
    end
  end

  context "Take Off" do
    it "expects Airplane to respond to a take_off method" do
      expect(subject).to respond_to(:take_off)
    end

  end

  context "In flight" do
    it "expects Airplane to resond to a flying? method" do
      expect(subject).to respond_to(:flying?)
    end

  end

  context "Landing" do

    it "expects Airplane to respond to a land_at_airport method" do
      expect(subject).to respond_to(:land_at_airport)
    end

    it "expects Airplane to respond to a landed? method" do
      expect(subject).to respond_to(:landed?)
    end

    it "expects landed? to be true if the plane has landed" do
      expect(subject).to be_landed
    end

  end







end
