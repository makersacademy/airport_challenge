
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  context 'airport runway approach/depart' do

    it 'a plane should respond that it is on the ground when on the runway of a specific airport' do
      airport1 = Airport.new
      airport1.instance_variable_set :@runway_traffic, [plane]
      # Places subject plane in runway
      message = "I'm at #{airport1}!"
      expect(plane.report_status airport1).to eq message
    end

    it 'a plane should respond that it is in the air when not on the runway' do
      # Tests an empty runway, no variable set required
      airport1 = Airport.new
      # Places subject plane in runway
      message = "I'm no longer at #{airport1}!"
      expect(plane.report_status airport1).to eq message
    end

    it 'a plane should report where it is' do
      expect(plane.find_the_plane). to eq "I am at #{airport}"
    end


  end

end
