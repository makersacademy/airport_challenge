require "airport.rb"

describe Airport do
  subject(:airport) { Airport }
  it { is_expected.to respond_to(:new).with(1).argument }

  subject(:airport) { Airport.new("Paris") }
  it { is_expected.to respond_to(:airport_name) }


end
