# frozen_string_literal: true

module LogParser
  class LogLine
    private_class_method :new

    def self.call(file_line)
      new(*file_line.split)
    end
    
    attr_reader :url, :ip

    def initialize(url, ip)
      @url = url
      @ip = ip
    end
  end
end
