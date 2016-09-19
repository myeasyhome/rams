module ForbiddenValues
	extend ActiveSupport::Concern
	REGEX_NAME_FORMAT = /\A[a-zA-Z]+\Z/
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_EMAILS = /\A[a-z0-9._%+-]+@rams+\.[a-z]{2,4}\Z/i

	def email_is_allowed
		if email.match(/\A[a-z0-9._%+-]+@rams+\.[a-z]{2,4}\Z/i)
			errors.add(:email,"error! email has been restricted!")
		end		
	end

  def valid_score?
    if !(Test.find(test_id).max_score >= score)
      errors.add(:score,"score is greater than maximum score for this test")
    end
  end
end
