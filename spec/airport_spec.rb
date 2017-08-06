require_relative '../lib/airport'
require_relative '../lib/weather'
require 'capybara/rspec'
require 'spec_helper'

describe Airport do
  let(:plane) { double :plane, land: false, landed: false, takeoff: nil }
  let(:weather) { double :weather }

  describe 'landing do' do

    it { is_expected.to respond_to(:land) }

    it 'can land planes' do
      allow(plane).to receive(:landed)
      planes_length = subject.planes.length
      expect(subject.land(plane)).to eq plane
      expect(subject.planes.length).to eq planes_length + 1
    end

    it 'cannot land plane if capacity is full' do
      full_airport = Airport.new
      full_airport.capacity.times { full_airport.land(plane) }
      expect { full_airport.land(plane) }.to raise_error 'Airport at capacity'
    end

    it 'can land planes when sunny' do
      allow(weather).to receive(:now).and_return(:sunny)
      my_airport = Airport.new
      my_airport.check_weather(weather)
      expect(my_airport.land(plane)).to eq plane
    end

    it 'cannot land planes when stormy' do
      allow(weather).to receive(:now).and_return(:stormy)
      my_airport = Airport.new
      my_airport.check_weather(weather)
      expect { my_airport.land(plane) }.to raise_error 'Not safe to land'
    end
  end

  describe 'taking off' do

    it { is_expected.to respond_to(:takeoff) }

    it 'removes plane from airport after taking off' do
      subject.land(plane)
      plane_count = subject.planes.length
      subject.takeoff
      expect(subject.planes.length).to eq plane_count - 1
    end

    it 'removes specific plane after taking off' do
      subject.land plane
      subject.takeoff
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'can takeoff planes when sunny' do
      my_airport = Airport.new
      my_airport.land(plane)
      allow(weather).to receive(:now).and_return(:sunny)
      my_airport.check_weather(weather)
      expect(my_airport.takeoff).to eq plane
    end

    it 'cannot takeoff planes when stormy' do
      my_airport = Airport.new
      my_airport.land(plane)
      allow(weather).to receive(:now).and_return(:stormy)
      my_airport.check_weather(weather)
      expect { my_airport.takeoff }.to raise_error 'Not safe to fly'
    end
  end

  describe 'capacity' do

    it 'has default capacity of 50' do
      expect(subject.capacity).to eq 50
    end

    it 'can set capacity' do
      custom_airport = Airport.new(100)
      expect(custom_airport.capacity).to eq 100
    end
  end

end

feature 'Journey from Montreal to London' do
  let(:plane) { double :plane, land: false, landed: false, takeoff: nil }
  let(:weather) { double :weather, now: :sunny }

  scenario 'in sunny conditions' do
    plane_from_montreal_sunny
    plane_lands_in_london_sunny
  end

  scenario 'from sunny to stormy' do
    plane_from_montreal_sunny
    plane_lands_in_london_stormy
  end

  scenario 'with stormy at start' do
    plane_from_montreal_stormy
  end

  def plane_from_montreal_sunny
    subject = Airport.new
    subject.land(plane)
    subject.check_weather(weather)
    expect(subject.takeoff).to eq plane
  end

  def plane_lands_in_london_sunny
    my_airport = Airport.new
    my_airport.check_weather(weather)
    expect(my_airport.land(plane)).to eq plane
  end

  def plane_lands_in_london_stormy
    allow(weather).to receive(:now).and_return(:stormy)
    my_airport = Airport.new
    my_airport.check_weather(weather)
    expect { my_airport.land(plane) }.to raise_error 'Not safe to land'
  end

  def plane_from_montreal_stormy
    allow(weather).to receive(:now).and_return(:stormy)
    subject = Airport.new
    subject.land(plane)
    subject.check_weather(weather)
    expect { subject.takeoff }.to raise_error 'Not safe to fly'
  end

end
