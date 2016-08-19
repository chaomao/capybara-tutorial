module PageWithPostNewDetail
  include Gizmo::PageMixin

  def valid?
    has_css?('#notice')
  end

  def notice_message
    find('#notice').text
  end

  def title
    find('#title').text
  end

  def content
    find('#content').text
  end

  def back_link
    find('a[href="/posts"]')
  end

  define_action :fill_post do |title, content|
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
  end
end