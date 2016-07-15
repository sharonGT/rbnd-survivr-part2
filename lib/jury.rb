require 'colorizr'

class Jury
	attr_accessor :members

	def initialize
		@members = [] # jury starts as an empty array
	end

	def add_member(member)
		@members << member 
	end

	def cast_votes(finalists) #jury can use this to cast votes at finalists
		finalists_votes = {} # returns hash of the 2 finalists

    	finalists.each do |finalist|
      		finalists_votes[finalist] = 0 # finalist's votes from the hash of finalists votes are equivalent to zero or rather nil. 
    	end

    	@members.each do |member| 
      		random_finalist = finalists_votes.keys.sample # sample means choosing random key from hash.
      		puts "#{member.to_s.yellow} voted for #{random_finalist.to_s.pink}."
      		finalists_votes[random_finalist] += 1 # guarantees moving on from each random finalist in a loop
    	end

    	return finalists_votes
  	end

  	def report_votes(final_votes)
  		final_votes.each do |participant, votes|
  			puts "#{participant.to_s.green} received #{votes.to_s.blue} votes."
  		end
  	end

  	def announce_winner(final_votes)
 		final_votes.each do |finalist, vote|
 			if vote >= 4
 				puts "The tribe has spoken, winner is #{finalist.name.upcase.blue}"
 				return finalist
 			end
 		end
  	end

end