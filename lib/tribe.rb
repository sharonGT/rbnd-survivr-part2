require 'colorizr'

class Tribe
	attr_reader :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		puts "#{@name.to_s.upcase.pink} team: "
		@members.each do |member| puts member.name 
		end
	end

	def to_s
		@name
	end

	def tribal_council(options={})
		@immune = options[:immune]
		members_with_no_immunity = @members.select {|member| member != @immune }
		members_voted_out = members_with_no_immunity.sample
		@members.delete(members_voted_out)
		return members_voted_out
	end
end