require 'airport'

describe Airplane do
  describe("#land") do
    it{is_expected.to respond.to(:land).with(1).argument}

    end
  end
end
