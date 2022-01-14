# frozen_literal_string: true

require 'plane'

RSpec.describe Plane do
  describe '#takeoff' do
    it 'sets plane state to airborne' do
      expect { subject.takeoff }
      .to change { subject.airborne }
      .from(false).to(true)
    end
  end
end
