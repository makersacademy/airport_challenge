require 'airport'

describe Airport do
  it { is_expected.to respond_to :hangar_capacity }
  it { is_expected.to respond_to :weather }
  it { is_expected.to respond_to :hangar }
end
