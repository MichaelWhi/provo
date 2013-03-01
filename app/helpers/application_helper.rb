module ApplicationHelper
  def save_as_pdf_link(text = "Save as PDF")
    link_to text, "http://pdfcrowd.com/url_to_pdf/?use_print_media=1&width=210mm&height=297mm&footer_text=%u,%20page%20%p"
  end
end
