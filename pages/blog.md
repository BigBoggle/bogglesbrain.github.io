---
layout: default
title: Blogposts Overview
---

## Blog Posts

{% assign sorted_posts = site.blog | sort: "date" | reverse %}

<ul>
  {% if sorted_posts.size > 0 %}
    {% for post in sorted_posts %}
      <li class="blog-entry">
        <div class="post-header">
          <a class="post-title" href="{{ post.url | relative_url }}"><b>{{ post.title }}</b></a>
          {% if post.date %}
            <span class="post-date">— {{ post.date | date: "%B %d, %Y" }}</span>
          {% endif %}
        </div>
        {% if post.description %}
          <p class="post-description"><i>{{ post.description }}</i></p>
        {% endif %}
        {% if post.thumbnail %}
        <img class="post-thumbnail"
        src="{{ post.thumbnail | relative_url }}"
        alt="Thumbnail for {{ post.title }}">
        {% endif %}
        <hr class="post-separator">
      </li>

    {% endfor %}
  {% else %}
    <li>It appears there are no blog posts. Those responsible have been sacked.</li>
  {% endif %}
</ul>
