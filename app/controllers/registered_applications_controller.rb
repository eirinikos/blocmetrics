class RegisteredApplicationsController < ApplicationController
  def index
  end

  def show
    @app = RegisteredApplication.find(params[:id])
  end

  def new
    @app = RegisteredApplication.new
  end

  def create
    @app = current_user.registered_applications.new(app_params)
    if @app.save
      flash[:success] = "Success!"
      redirect_to registered_applications_path
    else
      flash.now[:warning] = "Please enter a valid name and URL."
      render 'new'
    end
  end

  def destroy
    @app = RegisteredApplication.find(params[:id])
    if @app.destroy
      flash[:success] = "Removed!"
      redirect_to registered_applications_path
    else
      flash[:warning] = "Try again!"
    end
  end

  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
