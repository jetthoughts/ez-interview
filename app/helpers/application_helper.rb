module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true,
                                       disable_indented_code_blocks: true,
                                       autolink: true,
                                       tables: true,
                                       underline: true,
                                       highlight: true
    )
    markdown.render(text).html_safe
  end

  def mark_label_class(mark)
    if !mark.is_a?(Numeric)
      return 'label-default'
    end
    if mark < 20
      'label-danger'
    elsif 20 < mark && mark < 40
      'label-warning'
    elsif 40 < mark && mark < 60
      'label-info'
    elsif 60 < mark && mark < 80
      'label-primary'
    elsif 80 < mark && mark < 100
      'label-success'
    end
  end
end
