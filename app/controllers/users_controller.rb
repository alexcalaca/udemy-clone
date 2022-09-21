class UsersController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:index]

	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end
end
