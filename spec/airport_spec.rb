
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  context 'airport runway/terminals' do

    it 'a plane should be able to #land on a runway' do
      subject.land plane
      expect(subject.runway_traffic).to include plane

    end

    it 'a plane should be able to #take_off from airport' do
      subject.take_off plane
      expect(subject.runway_traffic).not_to include plane
    end

  end

end
