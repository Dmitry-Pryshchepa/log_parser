# frozen_string_literal: true

module LogParser
  class Loader
    class FileNotFound < StandardError; end
    class EmptyFile < StandardError; end

    def initialize(source)
      @source = source
      validate!
    end

    def perform
      File.readlines(source).map(&method(:create_line))
    end

    private

    attr_reader :source

    def validate!
      raise FileNotFound unless File.exist?(source)
      raise EmptyFile if File.empty?(source)
    end

    def create_line(file_line)
      LogParser::LogLine.new(*file_line.split)
    end
  end
end
