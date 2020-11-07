class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

def new
  @item = Item.new
end

def create
  @item = Item.create(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end


private
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :first_name, :last_name, :kanafirst_name, :kanamiddle_name, :birthday])
end
end

