# encoding: utf-8

class Collector

    @formatted = {}
    @raw = {}

    class << self
      attr_accessor :raw, :formatted

      def log(title, value)
        entry = case value
                  when Hash  then format_hash(value)
                  when Array then format_array(value)
                  else value
                end
        @raw.key?(title) ? @raw[title] << "\n #{entry}" : @raw[title] = entry.to_s
      end

      def process
        @formatted = @raw.map { |k, v| "\n#{k}:\n #{v}" }.join("\n")
        @raw.clear
        @formatted
      end

      def format_hash(hash)
        hash.map { |k, v| "#{k}: #{v}" }.join("\n ")
      end

      def format_array(array)
        array.join("\n ")
      end
    end

end