CHAPTERS:=$(shell ls -d asciidoc/[1-9]*)
OUTPUT_DIR:=$(shell pwd)/output
DEPLOY_DIR:=/var/www/html/learngitthehardway
BOOK_NAME:=learngitthehardway

include makefiles/Makefile.constants

.PHONY: chapters $(CHAPTERS) deploy docker check_host check_container

run: clean check_host docker
	docker run -v $(CURDIR)/output:/book/output lgthw make all

docker: clean check_host
	docker build -t lgthw .

chapters: $(CHAPTERS) 

$(CHAPTERS):
	$(MAKE) -C $@

clean:
	rm -rf $(OUTPUT_DIR)/* $(DEPLOY_DIR)/*

all: clean check_container chapters

# For forcing runs
FORCE:


# deploy
ifeq ($(shell hostname),rothko)

deploy: check_host run $(DEPLOY_DIR)

$(DEPLOY_DIR): FORCE
	cp -R output/9999.learngitthehardway.pdf output/learngitthehardway.pdf
	cp -R output/learngitthehardway.pdf learngitthehardway.pdf
	cp -R output/* $(DEPLOY_DIR)

else
deploy:
	shell hostname
	$(error not on rothko)
endif




# only run in a host
check_host:
	if [ -e /.dockerenv ]; then exit 1; fi
                                                                                                                                                                                                           
# only run in a container
check_container:
	if [ ! -e /.dockerenv ]; then exit 1; fi                                                                                                                                                               
