# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title, show_title = true)
    if page_title.empty?
      @content_for_title = "Федерация восточных танцев пензенской области."
    else
      @content_for_title = page_title.to_s
    end
  end
  
end
