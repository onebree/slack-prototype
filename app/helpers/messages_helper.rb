module MessagesHelper
  def emojify(content, **options)
    Twemoji.parse(h(content), options) if content.present?
  end

  def markdown_to_html(text)
    emojified_text = emojify(text)
    Kramdown::Document.new(emojified_text, :input => "GFM").to_html
  end
end
