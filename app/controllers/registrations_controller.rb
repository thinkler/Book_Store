class RegistrationsController < Devise::RegistrationsController

  before_filter :authorize_admin


  def new
    super
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless admin_signed_in?
  end

end 