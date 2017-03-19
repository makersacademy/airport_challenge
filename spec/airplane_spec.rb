require 'airplane'

describe Airplane do

  subject(:airplane) {Airplane.new}


  it { is_expected.to respond_to :landed? }



end
