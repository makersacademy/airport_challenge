require 'spec_helper'

define Airport do
    it {is_expected.to respond_to(:order_take_off)}
end
