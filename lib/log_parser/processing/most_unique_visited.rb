# frozen_string_literal: true

module LogParser
  module Processing
    class MostUniqueVisited
      def self.perform(data)
        grouped = data.group_by(&:url)
        grouped.map { |url, ips| [url, ips.uniq(&:ip).size] }
      end

      def self.description
        'List of webpages with most unique page views'
      end
    end
  end
end
