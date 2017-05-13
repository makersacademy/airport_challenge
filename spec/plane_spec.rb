require 'plane'

describe Plane do
  subject(:plane)  { described_class.new }

  it { expect(subject).to respond_to :landed? }
  it { expect(subject).to respond_to :status_landed }
  it { expect(subject).to respond_to :taken_off? }
  it { expect(subject).to respond_to :status_takenoff }

  it 'Allow updating state of a plane that has landed' do
    subject.status_landed
    expect(subject).to be_landed
  end

  it 'Allow updating state of a plane that has taken off' do
    subject.status_takenoff
    expect(subject).to be_taken_off
  end

end
