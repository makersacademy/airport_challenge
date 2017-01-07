require "airport.rb"

describe Airport do
  subject(:airport) { Airport.new }
  it { is_expected.to respond_to(:airport_name) }

end
