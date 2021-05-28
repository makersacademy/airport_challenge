require 'plane'

  describe Plane do
    it { should respond_to(:land) }
    it { should respond_to(:take_off)}
    it { should respond_to(:flying)}
  end