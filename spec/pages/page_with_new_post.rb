module PageWithNewPost
	include Gizmo::PageMixin

  def back_link
    find('a[href="/posts"]')
  end

  define_action :fill_post do |title, content|
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
  end

  def create_post_button
    find('.actions input[value="Create Post"]')
  end
end
