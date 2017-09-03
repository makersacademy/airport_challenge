
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  context 'airport runway approach/depart' do

    it 'a plane should respond that it is on the ground when on the runway' do
      Runway.class_variable_set :@@runway_traffic, [plane]
      # Places subject plane in runway
      expect(subject.report_status plane).to eq "I'm on the ground!"
    end

    it 'a plane should respond that it is in the air when not on the runway' do
      # Tests an empty runway, no variable set required
      expect(subject.report_status plane).to eq "I'm in the air!"
    end

  end

end
