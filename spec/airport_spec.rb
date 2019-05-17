require 'airport'

describe Airport do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it 'allows Airport objects to be created' do
      expect { Airport.new } .to_not raise_error
    end
  end
end
