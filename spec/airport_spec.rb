require 'airport.rb'

describe Airport do
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :takeoff }

  it { is_expected.to respond_to :empty? }

end