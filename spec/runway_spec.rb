require 'airport.rb'
require 'spec_helper'
require 'plane.rb'
require 'runway'

describe Runway do

  subject(:runway) { Airport.new }
  let(:airport) { double :airport }
  let(:plane) { double :plane }

  context 'weather conditions' do

    it 'reports true if #Stormy?' do
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.stormy?).to eq false
    end

  end

end
