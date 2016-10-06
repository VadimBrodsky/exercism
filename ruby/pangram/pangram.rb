module Pangram
  def self.is_pangram?(str)
    lowercase = str.downcase
    ('a'..'z').all? { |i| lowercase.include? i }
  end
end

module BookKeeping
  VERSION = 2
end
