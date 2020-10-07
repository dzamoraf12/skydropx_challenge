class ApplicationController < ActionController::API

  def render_json_error(status, error_code, extra = {})
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol

    error = {
      title: I18n.t("error_messages.#{error_code}.title"),
      status: status
    }.merge(extra)

    detail = I18n.t("error_messages.#{error_code}.detail", default: '')
    error[:detail] = detail unless detail.empty?

    render json: { error: error }, status: status
  end
end
