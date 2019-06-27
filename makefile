# $^ = dependencies of current rule
# $@ = target of current rule
# $< = first dependency of current rule
# % = pattern rule (only allowed in targets & dependencies, not in actions)
# $* = Wildcard (in actions) to replace the stem with which the rule matched
# 'wildcard' gets a list of files matching some pattern, which we can then save in a variable
# @echo = 'make' prints actions as it executes them. Using @ at the start of an action tells 'make' not to print this action. So, by using @echo instead of echo, we can see the result of echo (the variable’s value being printed) but not the echo command itself.
# 'patsubst' = (‘pattern substitution’) takes a pattern, a replacement string and a list of names in that order; each name in the list that matches the pattern is replaced by the replacement string. Again, we can save the result in a variable.
# We use ## so we can distinguish between comments that we want sed to automatically filter, and other comments that may describe what other rules do, or that describe variables.

include config.mk

## all : Generate archive of code, data, plots, summary table, makefile, and config.mk.
.PHONY: all
all: $(ZIPF_ARCHIVE)

$(ZIPF_ARCHIVE) : $(ZIPF_DIR)
	tar -czf $@ $(ZIPF_DIR)

$(ZIPF_DIR) : makefile config.mk  $(PNG_FILES) $(RESULTS_FILE) $(DAT_FILES) $(COUNT_SRC) $(ZIPF_SRC) $(PLOT_SRC) $(TXT_FILES)
	mkdir -p $@
	cp --parents $^ $@

## $(RESULTS_FILE) : Generate Zipf summary table.
$(RESULTS_FILE) : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

## dats : Count words in text files.
.PHONY: dats
dats: $(DAT_FILES)

%.dat : $(TXT_DIR)/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

## pngs : Generate image files depicting word count (from corresponding dat files)
.PHONY: pngs
pngs: $(PNG_FILES)

%.png : %.dat $(PLOT_SRC)
	$(PLOT_EXE) $< $@

## clean : Remove auto-generated files.
.PHONY: clean
clean:
	rm -rf $(ZIPF_DIR)
	rm -f $(ZIPF_ARCHIVE)
	rm -f $(RESULTS_FILE)
	rm -f $(PNG_FILES)
	rm -f $(DAT_FILES)
	rm -f callgrind*

## variables : Print variables used in the makefile
.PHONY : variables
variables:
	@echo LANGUAGE: $(LANGUAGE)
	@echo COUNT_SRC: $(COUNT_SRC)
	@echo ZIPF_SRC: $(ZIPF_SRC)
	@echo PLOT_SRC: $(PLOT_SRC)
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)
	@echo ZIPF_EXE: $(ZIPF_EXE)
	@echo COUNT_EXE: $(COUNT_EXE)
	@echo PLOT_EXE: $(PLOT_EXE)
	@echo TXT_DIR: $(TXT_DIR)
	@echo RESULTS_FILE: $(RESULTS_FILE)
	@echo ZIPF_DIR: $(ZIPF_DIR)
	@echo ZIPF_ARCHIVE: $(ZIPF_ARCHIVE)

.PHONY : help
help : makefile
	@sed -n 's/^##//p' $<

