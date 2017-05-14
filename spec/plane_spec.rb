require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { expect(subject).to respond_to :landed? }
  it { expect(subject).to respond_to :update_landed }
  it { expect(subject).to respond_to :reset_landed_flag }
  it { expect(subject).to respond_to :taken_off? }
  it { expect(subject).to respond_to :update_takenoff }
  it { expect(subject).to respond_to :reset_takenoff_flag }

  describe 'Plane landing tests:' do
    it 'Allow updating state of a plane that has landed' do
      subject.update_landed
      expect(subject).to be_landed
    end

    it 'Check plane already taken off not to take off again' do

    end

  end

  describe 'Plane taking off tests:' do
    it 'Allow updating state of a plane that has taken off' do
      subject.update_takenoff
      expect(subject).to be_taken_off
    end

    it 'Check plane already landed not to land again' do

    end
  end

end
