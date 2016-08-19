class MovieController < ApplicationController

	def index
		@ms = Movie.all		
	end
end
