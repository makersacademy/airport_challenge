require 'weather'
require  'airport'

describe Weather do

  subject(:weather) { Weather.new}

  it { is_expected.to respond_to(:random_conditions) }
  it { is_expected.to respond_to(:random_conditions) }

  context "#random_conditions" do
    it "return sunny from Conditions" do
      allow(subject).to receive(:random_conditions) { :sunny }
      expect(subject.random_conditions).to eq :sunny
  end

  it "returns stormy from Conditions" do
     allow(subject).to receive(:random_conditions) { :stormy }
     expect(subject.random_conditions).to eq :stormy
  end
  end

  context "#stormy" do

   it "returns true if stormy == stormy" do
     allow(subject).to receive(:random_conditions) { :stormy }
     expect(subject.stormy?).to eq true
    end

   it "returns false if stormy == stormy" do
     allow(subject).to receive(:random_conditions) { :sunny }
     expect(subject.stormy?).to eq false
   end
  end

  context "CONDITOINS" do

  it "returns stormy from conditions" do
    allow(subject).to receive(:conditions) { :stormy }
    expect(subject.conditions).to eq :stormy
  end

  it "returs sunny from CONDITIONS" do
    allow(subject).to receive(:conditions) { :sunny }
    expect(subject.conditions).to eq :sunny
   end
  end
end
