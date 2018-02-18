# frozen_string_literal: true

# permits resource's update without password
class RegistrationsController < Devise::RegistrationsController
  # permits resource's update without password

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end