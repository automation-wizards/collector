# encoding: utf-8

class MagicLogger

    @formatted = {}
    @raw = {}

    class << self
      attr_accessor :raw, :formatted

      def log(title, value)
        safe_value = value.clone rescue value
        entry = case safe_value
                  when Hash  then format_hash(safe_value)
                  when Array then format_array(safe_value)
                  else safe_value
                end
        @raw.key?(title) ? @raw[title] << "\n #{entry}" : @raw[title] = entry.to_s
      end

      def clear
        @raw.clear
      end

      def pretty_text
        @raw.map { |k, v| "\n#{k}:\n #{v}" }.join("\n")
      end

      def process
        warn "[DEPRECATION] `process` is deprecated.  Please use `pretty_text` instead. "
        pretty_text
      end


      def format_hash(hash)
        hash.map { |k, v| "#{k}: #{v}" }.join("\n ")
      end

      def format_array(array)
        array.join("\n ")
      end
    end

end