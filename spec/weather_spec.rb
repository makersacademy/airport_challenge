require 'weather'

describe Weather do

    context 'responds to' do
      it { is_expected.to respond_to(:stormy?)}
    end

end
