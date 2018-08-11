require 'die'
describe Die do
  describe "#roll" do
    it ".roll - Die.roll will return a number between 1 and 6" do
      expect(subject.roll).to be_between(1, 6).inclusive
    end
  end

end
