require './lib/plane.rb'

describe Planes do
  it { is_expected.to respond_to :status_grounded? }
end
