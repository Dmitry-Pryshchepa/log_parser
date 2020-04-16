# frozen_string_literal: true

module LogParser
  class LogLine
    attr_reader :url, :ip

    def initialize(url, ip)
      @url = url
      @ip = ip
    end
  end
end
