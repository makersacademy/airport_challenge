require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  describe ' takeoff/landing status update tests:' do
    it 'should update airborne status with landing' do
      expect { plane.final_approach }.to change { plane.airborne }.from(true).to(false)
    end
    it 'should update airborne status with takeoff' do
      plane.final_approach
      expect { plane.takeoff }.to change { plane.airborne }.from(false).to(true)
    end
  end
  context ' status test:' do
    it ' plane should be able to confirm if it is airborne or not' do
      expect(plane.send(:airborne?)).to eq(true).or eq(false)
    end
    it ' plane should be able to confirm if it is docked in airport or not' do
      expect(plane.send(:docked?)).to eq(true) or eq(false)
    end
  end
end
