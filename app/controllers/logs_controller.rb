class LogsController < ApplicationController

def index
	@logs =Log.all include: :user_id
	@log = Log.new
end



def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id
   
    if @log.save
        redirect_to current_user 
    else
        flash[:error] = "Problem!"
        redirect_to current_user
    end
end
private

	def log_params
		params.require(:log).permit(:when, :address, :address_2, :city, :state, :zip, :title, :description, :media_type, :category, :latitude, :longitude)
	end




end
