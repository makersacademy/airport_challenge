require 'rspec'
require 'spec_helper'
require 'plane'

describe Plane do
  # let(:airport) { double :airport }
  let(:weather) { double :weather }


  context '.land' do
    it 'lands at the airport when instructed' do
      plane = Plane.new
      expect(plane.land).to eq true
    end
  end

  context '.take_off' do
    it 'takes off if the weather is not stormy' do
      plane = Plane.new
      weather.stormy = 0
      expect(plane.take_off(weather)).to eq 'take off'
    end

    it 'does not take off if the weather is stormy' do
      plane = Plane.new
      weather.stormy = 1
      expect(plane.take_off(weather)).to eq 'stormy weather prevents take off'
    end
  end

  # context '.flying' do
  #   it 'confirms that it is flying' do
  #     plane = Plane.new

  #   end
  # end

end
