module PageWithShowPost
	include Gizmo::PageMixin

  def valid?
		has_css?('.title')
    has_css?('.content')
	end

  def notice_message
    find('#notice').text
  end

  def post_title
    find('.title').text
  end

  def post_content
    find('.content').text
  end

  def back_link
    find('a[href="/posts"]')
  end
end
