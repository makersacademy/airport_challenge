# frozen_string_literal: true

require 'plane'

describe Plane do
  describe '#new' do
    it 'creates an instance of Plane' do
      expect(Plane.new).to be_a(Plane)
    end
  end
end
