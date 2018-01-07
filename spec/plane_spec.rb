require 'plane'

describe Plane do
  it { is_expected.to respond_to :status }
  it { expect(subject.status).to eq 'flying' }
end
