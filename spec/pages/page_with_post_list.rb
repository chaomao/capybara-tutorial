module PageWithPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .left')
	end

	def posts_in_list
		find('.parent .left .posts').find('tbody').all('tr')
	end

	def posts_content
		find('.parent .left .posts').find('tbody').find('tr').all('td')
	end

	def new_post_link
		find('.parent .left a[href="/posts/new"]')
	end

	def edit_first_post_link
		find('.parent .left a[href="/posts/1/edit"]')
	end

	def show_first_post_link
		find('.parent .left a[href="/posts/1/show"]')
	end

	def create_post_button
		find('.actions input[value="Create Post"]')
	end
end
