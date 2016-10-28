module MessagesHelper
  def emojify(content, **options)
    if content.present?
      Twemoji.parse(h(content), options)
    else
      ""
    end
  end

  def markdown_to_html(text)
    emojified_text = emojify(text)
    Kramdown::Document.new(emojified_text, :input => "GFM").to_html
  end
end
