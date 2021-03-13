# frozen_string_literal: true

require_relative '../lib/weather'

describe Weather do
  describe '#weather_now' do
    it "should return either sunny or stormy" do
      expect(["sunny", "stormy"]).to include(subject.weather_now)
    end
  end
end