module PageWithTopTenList
  include Gizmo::PageMixin

  def valid?
    has_css?('.top-10-container')
  end

  def articles
    find('.top-10-list').all('li').collect(&:text)
  end

  def article_count
    find('.top-10-list').all('li').count
  end
end