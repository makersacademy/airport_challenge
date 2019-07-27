require 'spec_helper'
require 'airport'

describe Airport do
    it {is_expected.to respond_to(:order_take_off)}
end
