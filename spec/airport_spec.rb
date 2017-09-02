
require 'airport.rb'
require 'spec_helper'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  context 'airport runway/terminals' do

    it 'a plane should be able to land on a runway' do

      expect(subject.land).to include "plane"
    end

  end

end
