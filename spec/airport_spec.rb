
require 'airport.rb'
require 'spec_helper'
require 'plane.rb'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  context 'airport runway/terminals' do

    it 'a plane should be able to land on a runway' do
      subject.land plane
      expect(subject.runway).to include plane

    end

  end

end
