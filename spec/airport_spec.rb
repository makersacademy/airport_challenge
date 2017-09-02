
require 'airport.rb'
require 'spec_helper'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  context 'airport runway/terminals' do

    it 'should land a plane in a runway' do
      expect(subject.runway).to include "plane"
    end

  end

end
