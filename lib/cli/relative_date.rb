# frozen_string_literal: true

module MicroManager
  module CLI
    class RelativeDate
      def self.parse(string, *args) 
        date = parse_relative_date(string)
        return date if date

        Date.parse(string, *args) 
      end

      def self.parse_relative_date(string)
        regex = /(?<n>\d+)-(?<modifier>(day|week|month))/
        matches = string.match(regex)
        return unless matches

        Date.today + date_offset(matches[:n], matches[:modifier])
      end

      def self.date_offset(n, modifier)
        modifier_days = {
          "day" => 1,
          "week" => 7,
          "month" => 30
        } 

        n.to_i * modifier_days[modifier]
      end
    end
  end
end
