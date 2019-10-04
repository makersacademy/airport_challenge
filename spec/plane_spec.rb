require 'spec_helper'
require 'plane'

describe Plane do

  let(:airport) {double :airport, :add_plane => true, :remove_plane => true}

  describe '#land' do

    it {is_expected.to respond_to(:land)}

    it 'Accepts an airport as an argument' do
      expect(subject).to receive(:land).with(airport)
      subject.land(airport)
    end

  end

  describe '#flight_status' do

    it {is_expected.to respond_to(:flight_status)}

    it {expect(subject.flight_status).to eq('undefined')}

    it 'changes flight status when instructed to land' do
      subject.land(airport)
      expect(subject.flight_status).to eq('landed')
    end

    it 'changes flight status when instructed to land' do
      subject.take_off(airport)
      expect(subject.flight_status).to eq('flying')
    end

  end

  describe '#take_off' do

    it {is_expected.to respond_to(:take_off)}

    it 'accepts an airport as an argument' do
      expect(subject).to receive(:take_off).with(airport)
      subject.take_off(airport)
    end

  end

end
