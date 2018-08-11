require 'weather'

describe Weather do

  describe "#stormy?" do
    it ".stormy? - Weather class responds to this method" do
      expect(subject).to respond_to :stormy?
    end
  end

end
