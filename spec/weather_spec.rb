require 'rspec'
require 'spec_helper'
require 'weather'

describe Weather do
  # let(:airport) { double :airport }

  context '.conditions' do
    it 'becomes stormy or stays calm' do
      weather = Weather.new
      allow(weather).to receive(:conditions) { 1 }
    end
  end

  # context '.take_off' do
  #   it 'takes off' do
  #     plane = Plane.new
  #     plane.take_off
  #     expect(plane.take_off).to eq 'take off'
  #   end
  # end

  # context '.flying' do
  #   it 'confirms that it is flying' do
  #     plane = Plane.new

  #   end
  # end

end
