# frozen_string_literal: true

module LogParser
  module Processing
    class Sorter
      def self.perform(data)
        data.sort_by(&:last).reverse
      end
    end
  end
end
