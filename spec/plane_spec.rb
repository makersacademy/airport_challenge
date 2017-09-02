
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'

describe Plane do

  context 'airport runway approach/depart' do
    let(:airport) { double :airport }
    subject(:plane) { described_class.new }

    it 'a plane should respond that it is on the ground when on the runway' do

      Runway.class_variable_set(:@@runway, [subject])
      # Places subject plane in runway
      expect(subject.report_status).to eq "I'm on the ground!"
    end

    it 'a plane should respond that it is in the air when not on the runway' do
      Runway.class_variable_set(:@@runway, [])
      # Tests an empty runway
      expect(subject.report_status).to eq "I'm in the air!"
    end

  end

end
