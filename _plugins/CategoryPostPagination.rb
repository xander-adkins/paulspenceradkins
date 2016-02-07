module Jekyll

    class PostListingPage < Page

        # initialize
        def initialize(site, total_pages, current_page, current_posts)
            @site = site
            @total_pages = total_pages
            @current_page = current_page
            self.ext = '.html'
            self.basename = 'index'
            prev_page = nil
            next_page = current_page + 1
            if current_page > 1
                prev_page = current_page - 1
            end
            if next_page > total_pages
                next_page = nil
            end
        #     self.data = {
        #         'layout' => 'default',
        #         'title' => "Journal",
        #         'current_posts' => current_posts,
        #         'total_pages' => total_pages,
        #         'current_page' => current_page,
        #         'prev_page' => prev_page,
        #         'next_page' => next_page
        #     }
        #     self.content = <<-EOS
        #       <h1>Journal</h1>
        #       <h4>Sharing some of my ideas.</h4>
        #
        #       {% for post in page.current_posts %}
        #       <article>
        #           <h2>
        #               <a href="{{ post.url }}" title="Read more on {{ post.title }}" rel="bookmark">{{ post.title }}</a>
        #           </h2>
        #           <div>
        #               {{ post.excerpt }}
        #           </div>
        #           <div class="entry-meta">
        #               <em>{{ post.date | date: "%b %-d, %Y" }} by {{ site.author.name }}</em>
        #           </div>
        #       </article>
        #       {% endfor %}
        #
        #       <br>
        #
        #       {% if page.total_pages > 1 %}
        #           <div class="clearfix">
        #               {% if page.prev_page %}
        #                   {% if page.prev_page == 1 %}
        #                       <a class="pull-left" href="/journal/"></a>
        #                   {% else %}
        #                       <a class="pull-left" href="/journal/pages/{{ page.prev_page }}"></a>
        #                   {% endif %}
        #               {% endif %}
        #               {% if page.next_page %}
        #                   <a class="pull-right" href="/journal/pages/{{ page.next_page }}"></a>
        #               {% endif %}
        #           </div>
        #       {% endif %}
        #
        #   EOS
        #
        # end

        def url
            if @current_page == 1
                File.join("/", "journal", 'index.html')
            else
                File.join("/", "journal", "pages", "#{@current_page}", 'index.html')
            end
        end

        def to_liquid
            Utils.deep_merge_hashes(self.data, {
                "url" => self.url,
                "content" => self.content
            })
        end

        def html?
            true
        end

    end


    class CategoryPostPagination < Generator

        def generate(site)
            all_posts = site.categories[site.config['paginated_category']]
            site.data['all_posts'] = all_posts
            posts_per_page = Float(site.config['posts_per_page'])
            total_posts = Float(all_posts.size)
            total_pages = Float(total_posts / posts_per_page)
            total_pages = total_pages.ceil
            site.data['paginated_pages'] = Hash.new
            (1..total_pages).each do |page_num|
                site.pages << PostListingPage.new(site, total_pages, page_num, all_posts.slice!(0, posts_per_page.to_i))
            end
        end

    end

end
