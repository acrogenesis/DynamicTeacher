module ApplicationHelper
  DEFAULT_KEY_MATCHING = {
    alert:      :alert,
    notice:     :success,
    info:       :standard,
    secondary:  :secondary,
    success:    :success,
    error:      :alert,
    warning:    :warning
  }

  def display_flash_messages(key_matching = {})
    key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)
    flash.reduce '' do |message, (key, value)|
      if value.is_a?(Array)
        value.each do |val|
          message += build_message(key: key, value: val, key_match: key_matching)
        end
        message
      else
        build_message(key: key, value: value, key_match: key_matching)
      end
    end.html_safe
  end

  private

  def build_message(args)
    html = "<div class='row'><div class='small-12 columns'>"
    html += content_tag :div, data: { alert: '' }, class: "alert-box #{args[:key_match][args[:key].to_sym] || :standard}" do
      raw "#{args[:value]} #{link_to '&times;'.html_safe, '#', class: :close}"
    end
    html += '</div></div>'
    html.html_safe
  end
end
