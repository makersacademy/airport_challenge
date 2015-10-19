require 'weather'

describe 'Weather module' do

  subject { Weather }

  it { is_expected.to respond_to :stormy? }

end