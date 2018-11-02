require 'plane'

describe Plane do

  let(:airport) { double :airport }

  describe '#land' do

    it 'plane can land at an airport' do
      allow(airport).to receive(:hangar) { [] }
      allow(airport).to receive_message_chain(:weather, :what_is_weather) { 'sunny' }
      allow(airport).to receive(:hangar_full?) { false }
      expect(subject.land(airport)).to be_a_kind_of Array
    end

    it 'plane cannot land if already at an airport' do
      allow(airport).to receive(:hangar) { [] }
      allow(airport).to receive_message_chain(:weather, :what_is_weather) { 'sunny' }
      allow(airport).to receive(:hangar_full?) { false }
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error 'Plane has already landed'
    end

    it 'cannot land at an airport if stormy' do
      allow(airport).to receive_message_chain(:weather, :what_is_weather) { 'stormy' }
      expect { subject.land(airport) }.to raise_error 'Cannot land in stormy weather'
    end

    it 'cannot land at an airport if there is no space left' do
      allow(airport).to receive(:hangar) { [] }
      allow(airport).to receive_message_chain(:weather, :what_is_weather) { 'sunny' }
      allow(airport).to receive(:hangar_full?) { true }
      expect { subject.land(airport) }.to raise_error 'Cannot land at full airport'
    end

  end

  describe '#takeoff' do

    it 'cannot take off if it is not on the ground' do
      expect { subject.takeoff }.to raise_error('Plane cannot takeoff when not on ground')
    end

    it 'cannot take off if it is stormy' do
      subject.landed = true
      allow(subject.at_airport).to receive_message_chain(:weather, :what_is_weather) { 'stormy' }
      expect { subject.takeoff }.to raise_error('Plane cannot takeoff when weather is stormy')
    end

    it 'can take off when in airport and weather is sunny' do
      subject.landed = true
      allow(subject.at_airport).to receive_message_chain(:weather, :what_is_weather) { 'sunny' }
      allow(subject.at_airport).to receive_message_chain(:hangar, :delete) { [] }
      expect(subject.takeoff).to eq('none')
    end

  end

end
