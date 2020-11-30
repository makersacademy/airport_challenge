require 'rspec'
require './lib/plane.rb'

  describe Plane do
    it "can create instances of itself" do
      expect(subject).to be_a(Plane)
    end
    it "creates planes that are airborne by default" do
      p1 = Plane.new
      expect(p1.airborne).to eq(true)
    end
  end
