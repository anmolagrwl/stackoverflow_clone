class User < ActiveRecord::Base
	has_many :questions
	has_many :answers
	has_secure_password

	validates :username, presence: true, uniqueness: {case_sensitive: false},
						length: {in: 4..12},
						format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

	validates :password, length: {in: 4..14}	
	validates :password_confirmation, length: {in: 4..14}	

	def your_questions(params)
		questions.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')				
	end				
end
