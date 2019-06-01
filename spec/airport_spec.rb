require 'airport'

RSpec.describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :weather }

  it 'cannot land plane in stormy weather' do

  end

end
