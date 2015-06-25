def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        # We delete the session created by an incomplete subscription if it exists.
        if !session[:subscription].nil?
          session[:subscription] = nil
        end

        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => redirect_location(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      # Solution for displaying Devise errors on the homepage found on:
      # http://stackoverflow.com/questions/4101641/rails-devise-handling-devise-error-messages
      flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages
      # We store the invalid object in session so the user hasn't to fill every fields again.
      # The session is deleted if the subscription becomes valid.
      session[:subscription] = resource
      redirect_to root_path #Set the path you want here
    end
  end