require 'airport'

describe Airport do

  it 'instructs planes to land at an airport' do
    it { is_expected. to respond_to(:land).with(1).argument
    }
  end

end
