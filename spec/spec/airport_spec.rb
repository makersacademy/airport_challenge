require 'airport.rb'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :plane_in_airport? }

  end
