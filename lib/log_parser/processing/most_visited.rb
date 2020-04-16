# frozen_string_literal: true

module LogParser
  module Processing
    class MostVisited
      def self.perform(data)
        grouped = data.group_by(&:url)
        grouped.map { |url, ips| [url, ips.size] }
      end

      def self.description
        'List of webpages with most page views'
      end
    end
  end
end
