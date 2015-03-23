require 'plane'

describe Plane do

  it { is_expected.to respond_to :status }

  it { is_expected.to respond_to :landed }

  it { is_expected.to respond_to :take_off }

  it 'has a flying status when created' do
    expect(Plane.new.status).to eq 'flying'
  end
end
