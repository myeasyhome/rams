class Candidate < ActiveRecord::Base
	
	include ForbiddenValues

	has_many :achievements
	has_many :experiences
	has_many :links
	has_many :projects
	has_many :references
	has_and_belongs_to_many :skills
	has_and_belongs_to_many :qualifications
		

	validates :first_name, :format => REGEX_NAME_FORMAT, 
			:presence => true, length: {maximum: 20}
	validates :last_name, :format => REGEX_NAME_FORMAT,
			:presence => true, length: {maximum: 20}
	validates :email, :presence => true, :length => { :maximum => 100 },
			 :format => EMAIL_REGEX, :confirmation => true, 
			 :uniqueness => true
	validate :email_is_allowed



	

end	
