module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input type="hidden" name="authenticity_token"
     value="#{form_authenticity_token}">
    HTML
  end

  def log_out_button
    <<-HTML.html_safe
    <form action="#{session_url}" method="post">
      <input type="hidden" name="_method" value="delete">
      #{auth_token}
      <button>Log Out</button>
    </form>
    HTML
  end

  def destroy_button(url, text)
    <<-HTML.html_safe
    <form action="#{url}" method="post">
      <input type="hidden" name="_method" value="delete">
      #{auth_token}
      <button>#{text}</button>
    </form>
    HTML
  end

  def post_or_patch(record)
    if record.persisted?
      '<input type="hidden" name="_method" value="put">'.html_safe
    else
      ''
    end
  end

  def ugly_lyrics(lyrics)
    lyrics.split("\n").map do |line|
      line.blank? ? line : "&#9835; #{h(line)}"
    end.join("\n").html_safe
  end
end
