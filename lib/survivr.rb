require "colorizr"


require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================
ELIMINATIONS_PHASE_1 = 8
ELIMINATIONS_PHASE_2 = 3
ELIMINATIONS_PHASE_3 = 7

#This is where you will write your code for the three phases
def phase_one
	puts
	puts "PHASE 1"
	ELIMINATIONS_PHASE_1.times do
		no_immunity_tribe = @borneo.immunity_challenge	
		puts "#{no_immunity_tribe} is voting someone off tonight".blue
		member_voted_out = no_immunity_tribe.tribal_council
		puts "The tribe has spoken. #{member_voted_out} is going home tonight".red
		puts
	end
end

def phase_two
	puts
	puts "PHASE 2"
	ELIMINATIONS_PHASE_2.times do 
		member_immunity = @borneo.individual_immunity_challenge
		puts "#{member_immunity.to_s} wins immunity.".green
		member_voted_out = @merge_tribe.tribal_council({immune: member_immunity})
		puts "#{member_voted_out.name} has been eliminated".red
		puts
	end
end

def phase_three
	puts
	puts "PHASE 3"
	ELIMINATIONS_PHASE_3.times do
		member_immunity = @borneo.individual_immunity_challenge
		puts "#{member_immunity.to_s} wins immunity.".green
		member_voted_out = @merge_tribe.tribal_council({immune: member_immunity})
		@jury.add_member(member_voted_out)
		puts "#{member_voted_out.name} has been eliminated and will join jury".red
		puts
	end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
# phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
# phase_two #3 more eliminations
 @jury = Jury.new
# phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 @jury.report_votes(vote_results) #Jury announces their votes
 @jury.announce_winner(vote_results) #Jury announces final winner
