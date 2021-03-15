
class Air_traffic_controller

  # attr_accessor
  attr_reader :first_name, :last_name, :id_number
  # attr_writer

  def initialize(options={})
    self.first_name = options[:first_name] || 'Matthew'
    self.last_name = options[:last_name]
    self.id_number = (options[:id_number]).to_s
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end

