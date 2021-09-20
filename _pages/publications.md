---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

Argote, Pablo, John Marshall, Sarah Daly, Oscar Pocasangre, Elena Barham and Julián Gerez (2021).
"The Shot, the Message, and the Messenger: COVID-19 Vaccine Acceptance in Latin America", Nature
Partner Journals Vaccines

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
