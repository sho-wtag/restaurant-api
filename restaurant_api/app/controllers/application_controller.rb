class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from StandardError, with: :render_standard_error

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_standard_error(exception)
    logger.error "ERROR MESSAGE:: #{exception.message}"
    render json: {
      status: 500,
      error: 'Unhandled error',
      message: 'An unexpected error occurred.'
    }, status: :internal_server_error
  end
end
