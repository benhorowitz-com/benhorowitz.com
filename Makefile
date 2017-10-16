setup:
	sudo -H pip install awscli --upgrade --ignore-installed six

deploy:
	aws s3 sync --delete --exclude ".git/*" --exclude "Makefile" ./ s3://benhorowitz.com
