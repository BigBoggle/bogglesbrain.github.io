# -- Directories -- #
POSTS_DIR :=  /home/boggle/Vaults/Boggle's Brain/Projects/Blog Site/Blogposts
RESUME_FILE := /home/boggle/Documents/Resume/main.pdf
TARGET_DIR := _blog

.PHONY: sync build serve clean publish

sync:
	@echo "Syncing posts from Vault..."
	rsync -a --delete "$(POSTS_DIR)/" "$(TARGET_DIR)/"
	
build: sync
	@echo "Building Site..."
	bundle exec jekyll build
	rsync -a --delete "$(POSTS_DIR)/" "$(TARGET_DIR)/"

serve: sync
	@echo "Starting local Jekyll server..."
	bundle exec jekyll serve --livereload

clean:
	rm -rf _site

# Optional: automatic commit + push
publish: build
	@echo "Committing new site build..."
	git add -A
	git commit -m "Update blogposts and rebuild site" || echo "No changes to commit."
	git push origin main
