module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'お土産案内さん'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
