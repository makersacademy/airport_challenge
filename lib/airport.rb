require_relative 'plane'

  class Airport
    attr_reader :planes

      def take_off
        fail "No plane has taken off" unless @planes
      end

    end
