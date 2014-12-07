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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: { id: id, fields: fields.gsub("\n", '') })
  end

  def markdown(text)
    render_options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow' }
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      tables: true,
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
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
