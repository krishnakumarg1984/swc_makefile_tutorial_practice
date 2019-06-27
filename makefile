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

## results.txt : Generate Zipf summary table.
results.txt : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

## dats : Count words in text files.
.PHONY: dats
dats: $(DAT_FILES)

%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

## pngs : Generate image files depicting word count (from corresponding dat files)
.PHONY: pngs
pngs: $(PNG_FILES)

%.png : %.dat $(PLOT_SRC)
	$(PLOT_EXE) $< $@

## zipf_analysis.tar.gz : create an archive of the data, code and results.
zipf_analysis.tar.gz : $(COUNT_SRC) $(ZIPF_SRC) $(TXT_FILES) $(DAT_FILES) $(PNG_FILES) results.txt
	mkdir zipf_analysis
	cp -r $^ zipf_analysis/
	tar -czf $@ zipf_analysis

## clean : Remove auto-generated files.
.PHONY: clean
clean:
	rm -f results.txt
	rm -f $(PNG_FILES)
	rm -f $(DAT_FILES)
	rm -f callgrind*

## variables : Print variables.
.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

.PHONY : help
help : makefile
	@sed -n 's/^##//p' $<

