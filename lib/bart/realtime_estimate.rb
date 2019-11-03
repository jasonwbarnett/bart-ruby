# frozen_string_literal: true

class Bart
  class RealtimeEstimate
    PROPERTIES = %i[
      from
      to
      minutes
      platform
      direction
      length
      color
      hex_color
      bike_flag
      delay
    ].freeze

    attr_accessor(*PROPERTIES)

    def initialize
      yield self if block_given?
    end
  end
end
