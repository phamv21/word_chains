require 'set'
words = File.readlines("./dictionary.txt").map { |w| w.chomp.downcase }.uniq
DICTIONARY = Set[*words]
ALPHABET = ("a".."z").to_a