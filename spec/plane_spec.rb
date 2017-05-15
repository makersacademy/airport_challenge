require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { expect(subject).to respond_to :landed? }
  it { expect(subject).to respond_to :taken_off? }

  describe 'Plane landing tests:' do
    it 'Allow updating state of a plane that has landed' do
      plane.update_landed
      expect(plane).to be_landed
    end

  end

  describe 'Plane taking off tests:' do
    it 'Allow updating state of a plane that has taken off' do
      plane.update_takenoff
      expect(plane).to be_taken_off
    end

  end

end
