# models.rb
# MongoDB database models definitions

### MODELS
require 'mongo_mapper'	# for db hooks

class Fight
	include MongoMapper::Document
	# a new fight is created when a fighter mentions another
	key :status, String # active when the second user has accepted the fight
	key :title, String # so we can identify a fight based on both usernames but without looking up challenger and challenged
	key :challenger, String
	key :challenged, String

	many :fight_actions
end

class FightAction
	include MongoMapper::EmbeddedDocument
	# logs each action taken during a fight
	key :from, String
	key :move, String
	key :to, String

	timestamps!

end

class Fighter
	include MongoMapper::Document
	# stores stats on each fighter

	key :user_name, String
	key :xp_points, Integer
	key :fights_hp, Hash
end