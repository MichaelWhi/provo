MARKDOWN_HTML = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(filter_html: true),
        :autolink => true, :space_after_headers => true)