.PHONY: build push clean

build:
	@echo ========================================
	@echo Downloading Imagebuilder
	@echo ========================================
	docker pull lmhd/imagebuilder
	@echo
	@echo ========================================
	@echo Running
	@echo ========================================
	docker run -t --rm -v /var/run/docker.sock:/var/run/docker.sock lmhd/imagebuilder -g git@github.com:lucymhdavies/docker-images.git -b latest


apply:
	@echo TODO

clean:
	@echo TODO
