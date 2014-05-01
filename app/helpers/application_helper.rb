module ApplicationHelper
  def custom_devise_error_messages
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="ui error message" id="error_explanation">
      <i class="close icon"></i>
      <div class="header">#{sentence}</div>
      <ul class="list">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def abbr_timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:abbr, "", options.merge(:title => time.iso8601)) if time
  end

  def timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:div, "", options.merge(:title => time.iso8601)) if time
  end

  def span_timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:span, "", options.merge(:title => time.iso8601)) if time
  end
end
