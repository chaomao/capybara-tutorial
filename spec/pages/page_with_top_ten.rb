module PageWithTopTen
	include Gizmo::PageMixin

  def valid?
    has_css?('.parent .right')
  end

  def tips
    find('.tips')
  end

  def top_ten_posts
    find('.top-10-list').find('li')
  end
end
