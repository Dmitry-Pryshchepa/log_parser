# frozen_string_literal: true

module LogParser
  module Processing
    class Decorator
      def self.perform(data, description = nil)
        "#{description}\n\n" + data.map { |row| row.join(' ') }.join("\n") + "\n\n"
      end
    end
  end
end
