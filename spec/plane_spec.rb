require 'plane'

describe Plane do
  subject(:plane)  { described_class.new }

  it { expect(subject).to respond_to :suitable_for_flying? }
  it { expect(subject).to respond_to :landed? }
  it { expect(subject).to respond_to :taken_off? }

  it 'Allow reporting a plane has landed' do
    subject.report_landed
    expect(subject).to be_landed
  end

  it 'Allow reporting a plane has taken off' do
    subject.report_takenoff
    expect(subject).to be_taken_off
  end

end
