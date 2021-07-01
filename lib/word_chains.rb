require_relative 'dictionary'

class WordChains
    def initialize
        @source = ""
        @target = ""
        @map = Hash.new{|h,k| h[k] = Set[]}
    end

    def adjacent(word)
        word.each_char.with_index do |el,i|
            ALPHABET.each do |new_e|
                if new_e != el
                new_word = word[0...i]+ new_e +word[i+1..-1]
                end
                @map[word] << new_word if DICTIONARY === new_word
            end
        end
        @map[word]
    end
    def ask(promt)
        puts promt
        input = gets.chomp.downcase
    end


    def trace(word_set)
        return true if word_set === @target
        grow_word_set = word_set.inject(Set[]){|a,b| a + self.adjacent(b)}
        trace(grow_word_set)    
    end

    def run
        while true
        source = self.ask("what is the souce?")
        target = self.ask ("what is the target?")
            if source.length == target.length
            @source = source
            @target = target
            break
            else
                puts "the source and target should he the same length"
            end
        end
        
        source_to_target = self.adjacent(@source)
        if self.trace(source_to_target)
           result = [@target]
            until result[0] == @source
           @map.each do |root_word,word_set|
                    if word_set === result[0]
                    result.unshift(root_word)
                    break
                    end
                end
            end   
        end
        puts "the chains is:"
        p result 
    end

   

end


if __FILE__ == $PROGRAM_NAME
start = Time.now
word = WordChains.new
word.run
finish = Time.now
 diff = finish - start
 p diff
end