# frozen_literal_string: true

require 'plane'

RSpec.describe Plane do
  describe '#takeoff' do
    it 'sets plane state to airborne' do
      expect { subject.takeoff }
      .to change { subject.airborne }
      .from(nil).to(true)
    end

    it 'returns confirmation message of takeoff' do
      expect(subject.takeoff).to eq 'the plane is now airborn'
    end
  end

  describe '#land' do
    it 'sets plane airborne state to false' do
      expect { subject.land }
      .to change { subject.airborne }
      .from(nil).to(false)
    end
  end
end
