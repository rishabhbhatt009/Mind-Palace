# Jekyll Notes

## Jekyll Introduction
- Jekyll is a **static site generator** written in Ruby by Tom Preston-Werner
- Taken over by Parker Moore @GitHub
- Static Web pages - [wiki](https://en.wikipedia.org/wiki/Static_web_page) 

## Things you should know 
- Setting up the website 
- Creating Posts
- Creating Pages 
- Adding new themes 
- Hosting on GitHub Pages

## Installation :
- Ruby : Programming language
- Ruby Gems Program : package manager 
- Steps : 
	1. Install Ruby
	2. Install Ruby Gems
	3. Install Jekyll using Ruby Gems

## Directory structure 
- [Jekyll Documentation](https://jekyllrb.com/docs/structure/)  
- `site name` : main site folder 
	- `_post` : 
		- Default folder to store **blog posts** 
		- name convention : `YYYY-MM-DD-title.markdown` where '-' reps space 
		- you can create a markdown or html file  
		- make sure you add front matter 
	- `_drafts_` : 
		- ==self created== folder for **draft posts**
		- jekyll recognizes all files as draft content and does not display these contents
		- special command to build website with draft posts : `jekyll server --draft` 
		- name convention : similar to posts, without dates (automatically entered)
	- `dir1` : 
		- ==self created== folder for **pages**
		- URL : `/dir1/page` to access the page 
	- `_layouts` :
		- ==self created== folder to add custom layout in .html formal 
		- use `{{contnent'}}` variable to pull in  html content
		- you can use wrappers on top of layouts 
	- `_includes` : 
		- ==self created== folder to add [[#^5f4b1d | includes]]. 
		- these files can later pulled into various parts of the website such as layout or actual pages
		- `{% include <file name> <information> %}`
		- `{ include.information }` to access the shared information
	- `_site` : 
		- Default folder which holds the finished final version of your website. 
		- Continuously updated as we build our website, i.e. add more posts and elements. 
		- You can copy this onto a web server to run a website. 
		- ==We don't have to modify anything (automatically gets updated.==
		- subdir structure :
			- `about`
			- `assets`
			- `jekyll`
			- `404.html`
			- `feed.xml`
			- `index.html`
	- `_config.yml` : ==important==. Settings for our jekyll website.
		- `theme` - [[#^27bb0b | Themes in Jekyll]]
		- `defaults` - [[#^376d8b | Default Front Matter]]
		- 
	- `about.md` : About page on our website
	- `index.md` : Home page on our website
	- `Gemfile` : ==important==. Used with Ruby Store all **dependencies** for our website.
	- `Gemfile.lock`
	- `.jekyll-cache`
	- `404.html`
	- `.gitignore`

## Command DB

`jekyll new <website name>` 
- sets up a new website 
- creates the default initial folder structure 

`bundle exec jekyll serve <--draft>`
- builds website and starts local server
- [i] *Note :* `bundle exec` needs to be used for the first time only
- [!] *Debugging :* add Webrick manually using `bundle add webrick`
- `--draft` : to build draft content

#### Front Matter 
- Information we store about the pages on our website 
- Written in YAML or JSON (both of which use key value pairs)
- Jekyll uses the front matter to organize pages. Therefore, URL changes with the front matter. 
- Variables :
	- layout : 
		- skeleton of html code, makes the page look better  
		- "post" | "page" ==(depends on the theme we use)==
	- title : override the title and date
	- date : 
	- categories : 
	- permalink : 
		- with change in front matter the URL changes, it creates a *permanent link*, 
		- "/new-link" or /:categories/:day/:year/:month/:title.html (using variables)

```Markdown
---
layout: "post"
title: "New Title"
date: yyyy-mm-dd hh:mm:ss timezone
categories: cat1 cat2
permalink:

<!--you can add custom frontmatter variables-->
author:

--- 
```

#### Default Front Matter  
^376d8b
- we go to `_config.yml` and define `defaults:`
- for any file (post/page) which do not have specific front matter `default values` will be picked from here

```yml
defaults:
-
	scope:
		path: ""
		type:
	values:
		layouts: "post"
		title: "New Tital"
		
```


#### Themes in Jekyll
^27bb0b
- theme settings present in `_config.yml`
- by default jekyll uses `theme: minima`
- Finding different themes :
	- go to [rubygems.org](https://rubygems.org/) 
	- search for `jekyll-theme`
	- add theme dependency to  Gemfile : `gem "jekyll-theme-you-choose"`
	- `bundle install` to install all gem's (dependencies) inside gem file
	- finally `bundle exec jekyll serve` to build everything
	-  [!] *remember* : that layouts might be different for new themes 
	-  [!] check : `_layouts` in theme documentation 
	- you can also create custom layouts in html and use them

#### Variables 
- [Jekyll Documentation](https://jekyllrb.com/docs/variables/) 
- You can access variables from front matter on pages / layouts / sites
	- `{{content}}`
	- `{{site.title}}` : pulls from `_config.yml`
	- `{{post.title}}` : pulls from post front matter
	- `{{page.title}}` : pulls from current page front matter
	- `{{layout.author}}` : pulls from layout front matter
	- etc...

#### Includes 
^5f4b1d
- [Jekyll Documentation](https://jekyllrb.com/docs/includes/) 
- `{% include <file name> <information> %}`
- `{ include.information }` to access the shared information

#### Liquid Programming
- [Jekyll Documentation](https://jekyllrb.com/docs/liquid/)
- [Liquid Documentation](https://shopify.github.io/liquid/basics/introduction/)
- Jekyll uses Liquid as its template language, and adds a few objects, tags, and filters. These include objects representing content pages, tags for including snippets of content in others, and filters for manipulating strings and URLs.
<br>
- Objects :
	- contains content that is displayed on the page
	- accessed using : `{{object.variable}}`
- [Tags](https://jekyllrb.com/docs/liquid/tags/) :
	- **Tags** create the logic and control flow for templates.
	- accessed using : `{% <tag> %}`

```liquid
{% if page.title == "First Post"% and/or <condition2> }
  This is the first post I created.
{% elsif <condition> %}
	<block>
{% else <condition> %}
	<block>
{% endif %}

---------------------------
Output
Hello Adam!
```

```liquid
{% for post_name in site.post %}
	<li><a 
		style="{% if page.url == post_name.url %}color:red;{% endif %}" 
		hreaf="{{ post_name.url }}"
		>{{ post_name.title }}</a> </li> <br>
{% endfor %}
```

- [Filters](https://jekyllrb.com/docs/liquid/filters/) :
	- **Filters** change the output of an object or variable. 
	- They are used within double curly braces `{{ }}` and variable assignment, and are separated by a pipe character `|`
	- Entire list present in [Liquid Documentation](https://shopify.github.io/liquid/basics/introduction/)

```
{{ "/my/fancy/url" | append: ".html" }}

{{ "adam!" | capitalize | prepend: "Hello " }}

----------------------------------------
Outputs : 
/my/fancy/url.html
Hello Adam!

```

#### Data Files
- stored inside `_data` folder
- accessed using objects and variable : `site.data.<name of data file>`
- three formats : json, yaml or csv

#### Static Files
- any file that shouldn't  have front matter : .pdf, .jpeg, .png etc.
- can be stored in  `assets` folder, although location does not matter
- accessed using object and variable : `{{ file. <path / name / basename / extname> }}` 
- [i] can give default front matter in `config.yml`

## Hosting on GitHub Pages
- we can serve our static website on GitHub Pages for free
- Steps for hosting on GitHub :
	1. create new repository (don't initialize with README.md)
	2. modify variables inside `config.yml` file
		- `baseurl` : name of repo
		- `url` : custom domain name
	<br>
	3. Go to the project directory on local 
	4. Initialize repository : `git init`
	5. ==Create branch== `gh-pages`
		- all files for the website stored in the GitHub-pages branch of the project
		- `git checkout -b gh-pages`
	6. `git status`  : check status, all files should be visible
	7. `git add .`  : add to staging area
	8. `git commit -m "commit message"` : commit
	9. `git remote add origin <link>` : link local repo to the online GitHub repo
	10. `git push origin gh-pages` : push all files to GitHub repo
	11. Go to settings to access the public URL

## Resources
- [Mike Dane Jekyll Tutorial](https://www.youtube.com/watch?v=T1itpPvFWHI&list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB&ab_channel=MikeDane)
- [Jekyll Documentation](https://jekyllrb.com/docs/liquid/)
- [Liquid Documentation](https://shopify.github.io/liquid/basics/introduction/)