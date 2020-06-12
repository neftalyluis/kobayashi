# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from "ActionController::ParameterMissing",
              "ActionController::UnpermittedParameters", with: :parameters_missing
  rescue_from "ActiveRecord::RecordNotFound", with: :not_found

  def response_success(data = {})
    if data.keys.any?
      render status: :ok, json: data
    else
      render status: :no_content, json: {}
    end
  end

  def response_created(data = {})
    render status: :created, json: data
  end

  def parameters_missing(error)
    response_error(code: 400, message: error.message)
  end

  def not_found
    response_error(code: 404, message: "Resource not found.")
  end
=begin

  def forbidden
    message = "You don't have enough permissions for this action"
    response_error(code: 403, message: message)
  end

  def response_error(args = {})
    opts = { code: 420 }.merge(args)
    opts[:message] ||= t("api.http_response.errors.error_#{opts[:code]}")

    render status: opts[:code], json: {
        error: opts[:message]
    }
  end
=end
end
