module DeviseHelper

  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    puts messages
    html = <<-HTML
    <div class="alert alert-alert alert alert-dismissible fade show" role="alert">
      <strong>
       #{pluralize(resource.errors.count, "error")} must be fixed
      </strong>
      #{messages} fooboo
    </div>
    HTML

    html.html_safe
    
  end

end
