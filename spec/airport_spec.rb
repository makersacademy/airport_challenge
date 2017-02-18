require 'airport'

describe Airport do
  # it 'responds to take_off' do
  #   expect(subject).to respond_to :take_off
  # end
  it { is_expected.to respond_to :take_off }
end
