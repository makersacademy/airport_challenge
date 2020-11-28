require 'rspec'
require './lib/plane.rb'

  describe Plane do
    it "can create instances of itself" do
      expect(subject).to be_a(Plane)
    end
  end
