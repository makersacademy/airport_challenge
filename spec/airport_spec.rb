require 'rspec'
require 'spec_helper'
require_relative '../lib/airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { is_expected.to be_an Airport }
  it { is_expected.to(respond_to :land) }
  it { is_expected.to(respond_to :takeoff) }
  it { is_expected.to(respond_to :full?) }
  it { is_expected.to(respond_to :bad_weather?) }
  it { expect(subject.stormy).to be_truthy.or(be_falsey) }
  it { expect(Airport::DEFAULT_CAPACITY).to be_an Integer }
  it { expect(subject.capacity).to be_an Integer }
  it { expect(subject.planes).to be_an Array }
  it { expect(subject.planes).to all(Plane)}
end
describe Airport do
  it 'does not land in stormy weather' do
    weather = double("weather", stormy?: true)
    airport = Airport.new(10, weather)
    expect { airport.land }.to raise_error("Cannot land")
  end
  it 'does not takeoff in stormy weather' do
    weather = double("weather", stormy?: true)
    airport = Airport.new(10, weather)
    airport.planes = [Plane.new(false)]
    expect { airport.takeoff }.to raise_error(RuntimeError)
  end
  it 'does not land over capacity (if full)' do
    capacity = double("capacity", DEFAULT_CAPACITY: 0)
    weather = double("weather", stormy?: false)
    airport = Airport.new(capacity, weather)
    expect { airport.land }.to raise_error(ArgumentError)
  end
  it 'does not takeoff if there is no landed planes present' do
    weather = double("weather", stormy?: false)
    airport = Airport.new(10, weather)
    expect { airport.takeoff }.to raise_error(NoMethodError)
  end
  it '#takeoff fails if the plane is currently flying' do
    weather = double("weather", stormy?: false)
    airport = Airport.new(10, weather)
    airport.planes = [Plane.new(true)]
    expect { airport.takeoff }.to raise_error(RuntimeError)
  end
  it "#takeoff returns flying = true" do
    airport = Airport.new(10, false)
    airport.land
    expect(airport.takeoff).to eq(true)
  end
  it "#land returns flying = false" do
    airport = Airport.new(10, false)
    expect(airport.land).to eq(false)
  end
end
