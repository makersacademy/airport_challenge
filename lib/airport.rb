
class Airport

  # attr_accessor
  attr_reader :name, :terminal, :hanger, :runway
  # attr_writer

  def initialize(options={})
    self.name = options[:make] || 'Heathrow'
    self.terminal = (options[:terminal] || 4).to_i
    self.hanger = (options[:terminal] || 3).to_i
    self.runway = (options[:terminal] || 2).to_i
  end

=begin
  def full
  end

  def not_full
  end
=end

end