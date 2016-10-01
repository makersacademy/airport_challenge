require './lib/weather.rb'

describe Weather do

  it{ is_expected.to respond_to :forecast }

  it { is_expected.to respond_to :sunny}

  it { is_expected.to respond_to :stormy}


end
