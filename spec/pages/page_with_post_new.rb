module PageWithPostNew
  include Gizmo::PageMixin

  def valid?
    has_css?('#new_post')
  end

  def create_post_button
    find('.actions input[value="Create Post"]')
  end

  define_action :fill_post do |title, content|
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
  end
end