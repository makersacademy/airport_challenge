require 'rspec'
require_relative './spec_helper'
require_relative '../lib/airport'

describe Weather do
  it { is_expected.to(respond_to :stormy?) }
  it { is_expected.to(respond_to :weather_types) }
  it { expect(Weather::WEATHER_TYPES).to be_an Array }
end
