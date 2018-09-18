module ApplicationHelper

  def nav_link(title, path)
    classValue = current_page?(path) ? 'list-group-item disabled' : 'list-group-item'
    content_tag(:div) do
      link_to title, path, class: classValue
    end
  end

  def title(text)
    content_tag(:div, class: "page-header") do
      content_tag(:h1) do
        text
      end
    end
  end

  def format_date(date)
    # formatting date: Aug, 31 2007 - 9:55PM
    date.strftime("%d/%m/%Y")
  end

end
