module MarkdownHelper
  # for models
  
  def render_description
    self.rendered_description = MARKDOWN_HTML.render self.description
  end
  
  def smart_add_link_protocol
    unless self.link.blank?
      unless self.link[/^http:\/\//] || self.link[/^https:\/\//]
        self.link = 'http://' + self.link
      end
    end
  end
end
