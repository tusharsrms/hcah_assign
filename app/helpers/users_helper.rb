module UsersHelper
  def wicked_pdf_stylesheet_link_tag(*sources)
    sources.collect { |source|
      source = WickedPdfHelper.add_extension(source, 'css')
      "<style type='text/css'>#{read_asset(source)}</style>"
    }.join("\n").html_safe
  end
end
