
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }
  
  context 'airport runway approach/depart' do

    it 'a plane should respond to requests for confirmation of #take_off' do

      allow(airport).to receive(:take_off)
      airport.take_off subject
      expect(subject.report_status).to eq "I'm in the air!"
    end

  end

end
