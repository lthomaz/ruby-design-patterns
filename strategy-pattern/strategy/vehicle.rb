# frozen_string_literal: true

module Strategy
  class Vehicle
    def calculate_route(source, destination)
      raise NotImplementedError
    end
  end
end
