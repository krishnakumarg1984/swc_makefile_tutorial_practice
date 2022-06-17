include config.mk

#: all               : Generate archive of code, data, plots, summary table, Makefile, and config.mk.
.PHONY : all
all : $(ARCHIVE_FILE)

#: all_analysis      : build all targets ($(RESULTS_FILE) & $(PNG_FILES) except the archive)
.PHONY : all_analysis
all_analysis : $(RESULTS_FILE) $(PNG_FILES)

#: $(RESULTS_FILE)   : Generate Zipf summary table.
$(RESULTS_FILE) : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

#: dats              : Count words in text files.
.PHONY : dats
dats : $(DAT_FILES)

# Build each .dat file from the corresponding .txt file in books/
%.dat : $(TXT_DIR)/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

#: pngs              : Plot wordcount from dat files
.PHONY : pngs
pngs : $(PNG_FILES)

# Build each .png file from the corresponding .dat file
%.png : %.dat $(PLOT_SRC)
	$(PLOT_EXE) $< $@

#: $(ARCHIVE_FILE)   : project archive (code,data,plots,zipf summary table,Makefile,config.mk) i.e. the 'all_analysis' target + Makefile(s)
$(ARCHIVE_FILE) : all_analysis Makefile config.mk
	mkdir -p $(ARCHIVE_DIR)
	# https://stackoverflow.com/a/12284855
	cp -Ru $(COUNT_SRC) $(ZIPF_SRC) $(PLOT_SRC) $(TXT_DIR) $(DAT_FILES) $(RESULTS_FILE) $(PNG_FILES) $(filter-out $<,$^) $(ARCHIVE_DIR)/
	tar -czf $@ $(ARCHIVE_DIR)

#: clean             : Remove auto-generated files.
.PHONY : clean
clean :
	rm -rf $(DAT_FILES) $(PNG_FILES) $(RESULTS_FILE) $(ARCHIVE_DIR) $ $(ARCHIVE_FILE)
	rm -f callgrind.out.*

#: variables         : Print variables.
.PHONY : variables
variables:
	@echo ARCHIVE_DIR: $(ARCHIVE_DIR)
	@echo ARCHIVE_FILE: $(ARCHIVE_FILE)
	@echo TXT_DIR: $(TXT_DIR)
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

#: help              : Show help on available targets in the Makefile
.PHONY : help
help : Makefile
	@sed -n 's/^#://p' $<
