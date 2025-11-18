defmodule PortfolioTemplateWeb.SitemapController do
  use PortfolioTemplateWeb, :controller

  alias PortfolioTemplate.Blog

  def index(conn, _params) do
    posts = Blog.list_published_posts()
    base_url = PortfolioTemplateWeb.Endpoint.url()

    sitemap = """
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      <url>
        <loc>#{base_url}/</loc>
        <changefreq>monthly</changefreq>
        <priority>1.0</priority>
      </url>
      <url>
        <loc>#{base_url}/works</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
      </url>
      <url>
        <loc>#{base_url}/blog</loc>
        <changefreq>daily</changefreq>
        <priority>0.9</priority>
      </url>
    #{Enum.map_join(posts, "\n", fn post ->
      """
        <url>
          <loc>#{base_url}/blog/#{post.slug}</loc>
          <lastmod>#{DateTime.to_iso8601(post.last_updated)}</lastmod>
          <changefreq>weekly</changefreq>
          <priority>0.7</priority>
        </url>
      """
    end)}
    </urlset>
    """

    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(200, sitemap)
  end
end
