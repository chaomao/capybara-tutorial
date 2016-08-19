module PageWithTopPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .right')
	end

	def top_posts_in_list
		find('.top-10-container .top-10-list').all('li')
	end

	def first_top_post_name
		top_posts_in_list.first.text
	end

	def notice_message
		find('#notice').text
	end

	def back_link
		find('a[href="/posts"]')
	end

	define_action :fill_post do |title, content|
		fill_in('post_title', with: title)
		fill_in('post_content', with: content)
	end
end
