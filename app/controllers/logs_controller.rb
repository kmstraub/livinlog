class LogsController < ApplicationController

def index
	@logs = Log.all
	@log = Log.new
end
def new
    @log = Log.new
end
def show
    @log = Log.find(params[:id])
end
def edit
    @log = Log.find(params[:id])
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

def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
        redirect_to @log, notice: 'Log was successfully updated.'
    else
        render action: 'edit'
    end
end
def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_url

end

private

	def log_params
		params.require(:log).permit(:when, :address, :address_2, :city, :state, :zip, :title, :description, :media_type, :category, :latitude, :longitude)
	end




end
