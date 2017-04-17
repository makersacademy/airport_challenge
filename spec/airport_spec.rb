require 'airport'

describe Airport do

it { is_expected.to respond_to(:confirm_landing).with(1).argument}
it { is_expected.to respond_to(:confirm_takeoff).with(1).argument}
end
