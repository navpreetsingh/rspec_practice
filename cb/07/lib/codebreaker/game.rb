#---
# Excerpted from "The RSpec Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/achbd for more book information.
#---
module Codebreaker
  class Game
  
    def initialize(output)
    	@output = output
    end
    
    def start (secret=nil)
    	@secret = secret
    	@output.puts "Welcome to Codebreaker!"
    	@output.puts "Enter guess:"
    end
    
    def guess(guess)
    	mark = ""
        (0..3).each do |index|
            if exact_match?(guess, index)
    		  mark << "+"              
            elsif number_match?(guess, index) 
                mark << "-"
            end
    	end    	
    	@output.puts mark.split("").sort.join
    end    
    def exact_match?(guess, index)
        guess[index] == @secret[index]        
    end
    def number_match?(guess, index) 
        value = guess[index]
        if @secret.include?(value)        
            sc = @secret.count(value)
            i = 0
            gc = guess.count(value) 
            return true if sc >= gc                         
            (index+1..3).each do |ind|
                if exact_match?(guess, ind) 
                    i += 1
                    return false if(sc == i)
                end
                gc -= 1 if guess[ind] == value                
            end
            return false if gc > sc || gc == 0
            return true
        end
    end
  end
end

