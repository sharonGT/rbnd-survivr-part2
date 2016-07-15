class Game
attr_reader :tribes

	def initialize(*tribes)
		@tribes = tribes
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		@tribes.sample
	end

	def clear_tribes
		@tribes.clear
	end

	def merge(new_tribe)
		all_members = @tribes[0].members + @tribes[1].members
		clear_tribes
		add_tribe(Tribe.new({name:new_tribe, members:all_members}))
		return @tribes.first
	end

	def individual_immunity_challenge
		immunity_challenge.members.sample
	end
end