require_relative '../lib/airport'
require_relative '../lib/weather'
require 'capybara/rspec'
require 'spec_helper'

describe Airport do
  let(:plane) { double :plane, land: false, landed: false }
  let(:weather) { double :weather }

  it 'can land planes' do
    allow(plane).to receive(:landed)
    planes_length = subject.planes.length
    expect(subject.land_plane(plane)).to eq plane
    expect(subject.planes.length).to eq planes_length + 1
  end

  it 'can make planes takeoff' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'removes plane from airport after taking off' do
    allow(plane).to receive(:takeoff)
    subject.land_plane(plane)
    plane_count = subject.planes.length
    subject.takeoff
    expect(subject.planes.length).to eq plane_count - 1
  end

  it 'removes specific plane after taking off' do
    allow(plane).to receive(:takeoff)
    subject.land_plane plane
    subject.takeoff
    expect(subject.planes.include?(plane)).to eq false
  end

  it 'can takeoff planes when sunny' do
    allow(plane).to receive(:takeoff)
    air = Airport.new
    air.land_plane(plane)
    allow(weather).to receive(:now).and_return('sunny')
    air.check_weather(weather)
    expect(air.takeoff).to eq plane
  end

  it 'can land planes when sunny' do
    allow(plane).to receive(:takeoff)
    allow(weather).to receive(:now).and_return('sunny')
    air = Airport.new
    air.check_weather(weather)
    expect(air.land_plane(plane)).to eq plane
  end

  it 'cannot takeoff planes when stormy' do
    allow(plane).to receive(:takeoff)
    air = Airport.new
    air.land_plane(plane)
    allow(weather).to receive(:now).and_return('stormy')
    air.check_weather(weather)
    expect { air.takeoff }.to raise_error 'Not safe to fly'
  end

  it 'cannot land planes when stormy' do
    allow(plane).to receive(:takeoff)
    allow(weather).to receive(:now).and_return('stormy')
    air = Airport.new
    air.check_weather(weather)
    expect { air.land_plane(plane) }.to raise_error 'Not safe to land'
  end

  it 'has default capacity of 50' do
    expect(subject.capacity).to eq 50
  end

  it 'can set capacity' do
    custom_airport = Airport.new(100)
    expect(custom_airport.capacity).to eq 100
  end

  it 'cannot land plane if capacity is full' do
    full_airport = Airport.new
    full_airport.capacity.times { full_airport.land_plane(plane) }
    expect { full_airport.land_plane(plane) }.to raise_error 'Airport at capacity'
  end

end

feature 'Journey from Montreal to London' do
  let(:plane) { double :plane, land: false, landed: false, takeoff: nil }
  let(:weather) { double :weather, now: 'sunny' }

  scenario 'in sunny conditions' do
    plane_lands_in_montreal_sunny
    plane_takes_off_from_montreal_sunny
    plane_lands_in_london_sunny
  end

  scenario 'from sunny to stormy' do
    plane_lands_in_montreal_sunny
    plane_takes_off_from_montreal_sunny
    plane_lands_in_london_stormy
  end

  scenario 'with stormy at start' do
    plane_lands_in_montreal_sunny
    plane_takes_off_from_montreal_stormy
  end

  def plane_lands_in_montreal_sunny
    air = Airport.new
    air.check_weather(weather)
    expect(air.land_plane(plane)).to eq plane
  end

  def plane_takes_off_from_montreal_sunny
    subject = Airport.new
    subject.land_plane(plane)
    subject.check_weather(weather)
    expect(subject.takeoff).to eq plane
  end

  def plane_lands_in_london_sunny
    air = Airport.new
    air.check_weather(weather)
    expect(air.land_plane(plane)).to eq plane
  end

  def plane_lands_in_london_stormy
    allow(weather).to receive(:now).and_return('stormy')
    air = Airport.new
    air.check_weather(weather)
    expect { air.land_plane(plane) }.to raise_error 'Not safe to land'
  end

  def plane_takes_off_from_montreal_stormy
    allow(weather).to receive(:now).and_return('stormy')
    subject = Airport.new
    subject.land_plane(plane)
    subject.check_weather(weather)
    expect { subject.takeoff }.to raise_error 'Not safe to fly'
  end

end
