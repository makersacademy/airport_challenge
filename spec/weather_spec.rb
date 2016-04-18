require 'weather'

describe Weather do

  it {is_expected.to respond_to :stormy?}

  # it "randomizes the weather" do
  #   allow(subject.stormy?).to receive(:stormy?).and_return false
  #   expect(subject.stormy?).to be false
  # end


end
