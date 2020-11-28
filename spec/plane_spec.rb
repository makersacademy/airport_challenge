require 'rspec'
require './lib/plane.rb'

require './spec/airport_spec.rb'

  describe Plane do
    it "can create instances of itself" do
      expect(subject).to be_a(Plane)
    end
  end
