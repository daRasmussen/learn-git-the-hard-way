CHAPTERS:=$(shell ls -d asciidoc/[1-9]*)
OUTPUT_DIR:=$(shell pwd)/output
DEPLOY_DIR:=/var/www/html/learngitthehardway
BOOK_NAME:=learngitthehardway

include makefiles/Makefile.constants

.PHONY: chapters $(CHAPTERS) deploy docker check_host check_container


chapters: $(CHAPTERS) 

$(CHAPTERS):
	$(MAKE) -C $@

clean:
	rm -rf $(OUTPUT_DIR)/* $(DEPLOY_DIR)/*

all: clean chapters



# deploy
ifeq ($(shell hostname),rothko)

deploy: chapters $(DEPLOY_DIR)

$(DEPLOY_DIR): FORCE
	cp -R output/9999.learngitthehardway.pdf output/learngitthehardway.pdf
	cp -R output/learngitthehardway.pdf learngitthehardway.pdf
	cp -R output/* $(DEPLOY_DIR)

FORCE:

else
deploy:
	$(error not on rothko)
endif



check_host:
	# only run in a host
	if [ -e /.dockerenv ]; then exit 1; fi
                                                                                                                                                                                                           
check_container:
	# only run in a container
	if [ ! -e /.dockerenv ]; then exit 1; fi                                                                                                                                                               
        
docker: clean
	docker build -t lgthw --no-cache .
