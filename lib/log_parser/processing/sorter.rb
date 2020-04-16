# frozen_string_literal: true

module LogParser
  module Processing
    class Sorter
      def self.perform(data)
        data.sort_by { |row| -row.last }
      end
    end
  end
end
