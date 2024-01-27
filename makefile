BUILDDIR=build
ZIP=zip
ZIPFLAGS=-r -FS
ZIPEXCLUDES=-x '**~' 'build/*' '.*' 'makefile'
ZIPTARGET=$(BUILDDIR)/$(notdir $(CURDIR)).ipk3

TARGETS=$(BUILDDIR) $(ZIPTARGET)

.phony: all debug clean
all: $(TARGETS)

debug:
	@echo $(BUILDDIR)
	@echo $(ZIPTARGET)
	@echo $(ZIPEXCLUDES)

$(BUILDDIR):
	mkdir $(BUILDDIR)

$(ZIPTARGET) : *.* */*.lmp */*.png */*/*.png maps/*.wad *.zc */*/*.zc | $(BUILDDIR)
	$(ZIP) $(ZIPFLAGS) $(ZIPTARGET) * $(ZIPEXCLUDES)
