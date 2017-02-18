require 'plane'

describe Plane do
  # it 'responds to take_off' do
  #   expect(subject).to respond_to :take_off
  # end
  it { is_expected.to respond_to :flying? }
  it { is_expected.to respond_to :landed? }
end
